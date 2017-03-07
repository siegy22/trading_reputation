class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable,
    :omniauthable, omniauth_providers: [:reddit]

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true

  def self.from_reddit_omniauth(auth)
    where(reddit_uid: auth.uid).first_or_create do |user|
      user.reddit_name = auth.info.name
      user.name = user.reddit_name
    end
  end
end
