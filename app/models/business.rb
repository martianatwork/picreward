class Business < ActiveRecord::Base
  belongs_to :user
  has_many :campaigns
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :tva, presence: true, uniqueness: true
  validates :contact_name, presence: true
  validates :photo, presence: true
end
