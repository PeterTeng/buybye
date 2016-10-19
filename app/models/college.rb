# == Schema Information
#
# Table name: colleges
#
#  id   :uuid             not null, primary key
#  name :string           not null
#

class College < ApplicationRecord
  has_many :depertments
  has_many :items
end
