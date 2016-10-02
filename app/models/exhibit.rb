class Exhibit < ApplicationRecord
  has_many :comments
  has_many :exhibit_images
  belongs_to :user
end
