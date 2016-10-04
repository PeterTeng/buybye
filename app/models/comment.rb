class Comment < ApplicationRecord
  belongs_to :exhibit
  belongs_to :user
end
