class Trade < ApplicationRecord
  has_one :user
  has_one :buyer, class_name: "User"
  belongs_to :item
end
