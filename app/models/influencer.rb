class Influencer < ActiveRecord::Base
  belongs_to :user
  has_many :applications
  mount_uploader :photo, PhotoUploader
end
