class User < ApplicationRecord
  devise :rememberable, :trackable,
    :omniauthable, omniauth_providers: [:reddit, :steam, :discord, :windowslive]

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true

  has_many :connections

  def self.from_reddit_omniauth(auth)
    where(reddit_uid: auth.uid).first_or_create do |user|
      user.reddit_name = auth.info.name
      user.name = user.reddit_name
    end
  end

  def self.linkable_providers
    @linkable ||= omniauth_providers - [:reddit]
  end

  PROVIDER_NAME_FIELD = {
    steam: -> (auth) { auth.info.nickname },
    discord: -> (auth) { "#{auth.info.username}##{auth.info.discriminator}" },
    windowslive: -> (auth) { auth.info.name },
  }.with_indifferent_access

  # Link a new connection to the user
  def link_connection_from_omniauth!(auth)
    connection = connections.find_or_initialize_by(provider: auth[:provider],
                                                   uid:      auth[:uid])
    connection.name = PROVIDER_NAME_FIELD.fetch(auth[:provider]).call(auth)
    connection.save!
  end

  def connection_with_provider(provider)
    connections.find_by(provider: provider)
  end
end
