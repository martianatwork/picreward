class Campaign < ActiveRecord::Base
  belongs_to :business
  has_many :applications
end
