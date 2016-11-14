class LikeUser < ApplicationRecord
  belongs_to :liker, class_name: "User"
  belongs_to :like, class_name: "Item"
end
