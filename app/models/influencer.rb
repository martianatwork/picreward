class Influencer < ActiveRecord::Base
  belongs_to :user
  has_many :applications
  has_many :tags
  mount_uploader :photo, PhotoUploader

  def self.avg_photo_comments(token)
    total = 0
    client = Instagram.client(:access_token => token)
    client.user_recent_media.each do |media_item|
      total += media_item.comments[:count]
    end
    total / 20
  end

  def self.avg_photo_likes(token)
    total = 0
    client = Instagram.client(:access_token => token)
    client.user_recent_media.each do |media_item|
      total += media_item.likes[:count]
    end
    total / 20
  end

  def top_hashtags(token)
    hash = {}
    client = Instagram.client(:access_token => token)
    client.user_recent_media.each do |media_item|
      media_item.tags.each do |word|
        if hash[word]
          hash[word] += 1
        else
          hash[word] = 1
        end
      end
      hash.each do |k,v|
        Tag.create(influencer_id: id,
          name: k,
          frequency: v)
      end
      #   Tag.create(name: tag[0], frequency: tag[1])
    end
  end

  def self.top_places(token)
    # hash = {}
    # client = Instagram.client(:access_token => token)
    # client.user_recent_media.each do |media_item|
    #   if media_item.location

    #     media_item.location.name
    #     if hash[media_item.location.name]
    #       hash[media_item.location.name] += 1
    #     else
    #       hash[media_item.location.name] = 1
    #     end
    #   end
    # end
    # array << hash.sort_by {|k,v| v}.reverse


  end

  def self.username(token)
    client = Instagram.client(:access_token => token)
    client.user.username
  end


  def self.followers(token)
    client = Instagram.client(:access_token => token)
    client.user.counts.followed_by
  end
end
