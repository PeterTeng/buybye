# == Schema Information
#
# Table name: like_users
#
#  id       :integer          not null, primary key
#  liker_id :uuid             not null
#  like_id  :uuid             not null
#

class LikeUser < ApplicationRecord

  belongs_to :liker, class_name: "User"
  belongs_to :like, class_name: "Item"

end
