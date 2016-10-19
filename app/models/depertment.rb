# == Schema Information
#
# Table name: depertments
#
#  id         :integer          not null, primary key
#  college_id :uuid             not null
#  name       :string           not null
#

class Depertment < ApplicationRecord
  has_many :undergraduates
  has_many :items
  belongs_to :college
end
