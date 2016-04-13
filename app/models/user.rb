class User < ActiveRecord::Base
  include InfluencersHelper
  after_create :initialize_influencer
  has_one :influencer, dependent: :destroy
  has_one :business, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:instagram]

  def influencer?
    provider == 'instagram'
  end

def initialize_influencer
  if (influencer?)
    Influencer.create_for(self)
  end
end

def self.find_for_oauth(auth)
  # byebug
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
