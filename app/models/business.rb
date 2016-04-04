class Business < ActiveRecord::Base
  belongs_to :user
  has_many :campaigns
  mount_uploader :photo, PhotoUploader
end
