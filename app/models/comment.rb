# == Schema Information
#
# Table name: comments
#
#  id      :uuid             not null, primary key
#  user_id :uuid             not null
#  content :text             not null
#

class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user
end
