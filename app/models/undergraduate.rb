# == Schema Information
#
# Table name: undergraduates
#
#  id            :integer          not null, primary key
#  depertment_id :string           not null
#  name          :string           not null
#

class Undergraduate < ApplicationRecord
  has_many :items
  belongs_to :depertment
end
