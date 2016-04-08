class Influencer < ActiveRecord::Base
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :places, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :username, presence: true, uniqueness: true
  # validates :address, presence: true
  # validates :number, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  def self.avg_photo_comments(token)
    total = 0
    client = Instagram.client(:access_token => token)
    client.user_recent_media.each do |media_item|
      total += media_item.comments[:count]
    end
    total / 20
  end


  def self.create_for(user)
   comments_count = 0
   likes_count = 0
   influencer = self.create(
    user: user)
# client = Instagram.client(:access_token => "242894001.749d805.0696daa690cc44fabb22accca07be530")
client = Instagram.client(:access_token => user.token)
client.user_recent_media.each do |media_item|
 likes_count += media_item.likes[:count]
 comments_count += media_item.comments[:count]
 influencer.top_hashtags(media_item)
 influencer.top_places(media_item)
end
comments_count /= 20
likes_count /= 20


influencer.avg_photo_comments = comments_count
influencer.avg_photo_likes = likes_count

influencer.basic_info(client)
    # influencer.top_hashtags(user.token)
    # influencer.top_places(user.token)
    influencer.save!
  end


  def top_hashtags(media_item)
    hashtags_hash = {}
    media_item.tags.each do |word|
      if hashtags_hash[word]
        hashtags_hash[word] += 1
      else
        hashtags_hash[word] = 1
      end
    end
    hashtags_hash.each do |k,v|
      Tag.create(
        influencer: self,
        name: k,
        frequency: v)
    end
  end

  def top_places(media_item)
    places_hash = {}
    if media_item.location
      if places_hash.has_key?(media_item.location.name)
        places_hash[media_item.location.name] += 1
      else
        places_hash[media_item.location.name] = 1
      end
    end
    places_hash.each do |k,v|
      Place.create(
        influencer: self,
        name: k,
        frequency: v)
    end
  end

  def basic_info(client)
    self.username = client.user.username
    self.followers = client.user.counts.followed_by
    self.save!
  end

end

 # def import_followers
 #    response = user.client.user_follows
 #    followers = [].concat(response)
 #    next_cursor = response.pagination[:next_cursor]
 #    while !(next_cursor.to_s.empty?) do
 #      response = Instagram.user_follows(uid, {:cursor => next_cursor})
 #      next_cursor = response.pagination[:next_cursor]
 #      followers.concat(response)
 #    end
 #    return followers
 #  end
