class Campaign < ActiveRecord::Base
  belongs_to :business
  has_many :applications
  mount_uploader :photo, PhotoUploader
  geocoded_by :target_location
  after_validation :geocode, if: :target_location_changed?
  validates :reward_type, presence: true
  validates :title, presence: true
  validates :product, presence: true
  validates :goal, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: { message: "Description is mandatory, please specify one" }, length: {minimum: 10}
  validates :instructions, presence: true
  validates :pics_to_upload, presence: { message: "Rating is mandatory, please specify one" },
                              numericality: { only_integer: true,
                              greater_than_or_equal_to: 0
                              }
  validates :pics_to_post, presence: { message: "Rating is mandatory, please specify one" },
                              numericality: { only_integer: true,
                              greater_than_or_equal_to: 0
                              }
  validates :budget, presence: { message: "Rating is mandatory, please specify one" },
                            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0
                            }
end
