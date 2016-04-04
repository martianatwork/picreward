class Influencer < ActiveRecord::Base
  belongs_to :user
  has_many :applications
end
