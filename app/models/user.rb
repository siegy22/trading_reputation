class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable,
    :omniauthable, omniauth_providers: [:reddit]

  def self.from_reddit_omniauth(auth)
    where(reddit_uid: auth.uid).first_or_create do |user|
      user.reddit_name = auth.info.name
    end
  end
end
