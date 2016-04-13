class Influencer < ActiveRecord::Base
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :pics, dependent: :destroy


  def self.create_for(user)
   influencer = self.create(
    user: user)
   influencer.save!
   influencer.create_or_update_info(user, influencer)
    # client = Instagram.client(:access_token => "242894001.749d805.0696daa690cc44fabb22accca07be530")
  end

  def create_or_update_info(user, influencer)
   delete_old_data(influencer)
   comments_count = 0
   likes_count = 0

   client = Instagram.client(:access_token => user.token)
   client.user_recent_media.each do |media_item|
     likes_count += media_item.likes[:count]
     comments_count += media_item.comments[:count]
     influencer.top_hashtags(media_item)
     influencer.top_places(media_item)
     influencer.top_pics(media_item)
   end
   comments_count /= 20
   likes_count /= 20

   influencer.avg_photo_comments = comments_count
   influencer.avg_photo_likes = likes_count

   influencer.basic_info(client)
    # influencer.top_hashtags(user.token)
    # influencer.top_places(user.token)
    # influencer.save!
  end




  #how to update info when a user is signed in


  def top_hashtags(media_item)
    media_item.tags.each do |word|
      Tag.create(
        influencer: self,
        name: word)
    end
  end

  def top_pics(media_item)
    pics_hash = {}
    pics_hash[media_item.likes[:count]] = media_item.images.standard_resolution[:url]
    pics_hash.each do |k,v|
      Pic.create(
        influencer: self,
        likes: k.to_i,
        pic_url: v)
    end
  end


  def top_places(media_item)
    places_hash = {}
    if media_item.location
      Place.create(
        influencer: self,
        name: media_item.location.name)
    end
  end


  def basic_info(client)
    client.user.each do |info|
      # byebug
      if info[0] == "username"
        self.username = info[1]
      elsif info[0] == "counts"
        self.followers = info[1].followed_by
      elsif info[0] == "profile_picture"
        self.photo = info[1]
      elsif info[0] == "full_name"
        name = info[1].split
        self.first_name = name[0]
        self.last_name = name[1]
      end
      self.save!
    end

  end

  def delete_old_data(influencer)
    Tag.where("influencer_id = ?", influencer.id).each do |tag|
      tag.destroy
    end
    Place.where("influencer_id = ?", influencer.id).each do |place|
      place.destroy
    end
    Pic.where("influencer_id = ?", influencer.id).each do |pic|
      pic.destroy
    end
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
