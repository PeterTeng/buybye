class Depertment < ApplicationRecord
  has_many :undergraduates
  belongs_to :college
end
