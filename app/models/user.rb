class User < ActiveRecord::Base
  include InfluencersHelper
  # after_create :initialize_influencer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:instagram]

# def initialize_influencer
#   influencer = Influencer.create(
#   user_id: self.id,
#   avg_photo_comments: Influencer.avg_photo_comments(self.token),
#   avg_photo_likes: Influencer.avg_photo_likes(self.token),
#   followers: Influencer.followers(self.token),
#   username: Influencer.username(self.token)
#   )

#   influencer.top_hashtags(token)
#   influencer.top_places(token)
      # influencer.save!
# end

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
    # influencer = Influencer.create(
    #   user_id: 5,
    #   avg_photo_comments: Influencer.avg_photo_comments(self.token),
    #   avg_photo_likes: Influencer.avg_photo_likes(self.token),
    #   followers: Influencer.followers(self.token),
    #   username: Influencer.username(self.token)
    #   )

    #   influencer.top_hashtags(self.token)
    #   influencer.top_places(self.token)
    #   infleuncer.save!
  end

end
