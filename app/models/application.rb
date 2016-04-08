class Application < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :influencer
  validates :motivation, presence: true
  # validates :photo, presence: true
end
