class Campaign < ActiveRecord::Base
  belongs_to :business
  has_many :applications
  mount_uploader :photo, PhotoUploader
  geocoded_by :target_location
  after_validation :geocode, if: :target_location_changed?
end
