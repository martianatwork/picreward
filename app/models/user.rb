class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :omniauthable, omniauth_providers: [:instagram]
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def self.find_for_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.token = auth.credentials.token
      # user.token_expiry = Time.at(auth.credentials.expires_at)
      user.email = auth.info.nickname + "@example.com"
      user.save!
    end
  end

end
