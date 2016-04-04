class Campaign < ActiveRecord::Base
  belongs_to :business
  has_many :applications
  mount_uploader :photo, PhotoUploader
end
