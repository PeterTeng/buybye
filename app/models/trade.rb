class Trade < ApplicationRecord

  has_one :chat
  belongs_to :user
  belongs_to :buyer, class_name: "User"
  belongs_to :item
end
