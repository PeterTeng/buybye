class Favorite < ApplicationRecord
  has_many :users, through: :favorite_users
end
