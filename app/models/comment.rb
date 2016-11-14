# == Schema Information
#
# Table name: comments
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  item_id    :uuid             not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user
end
