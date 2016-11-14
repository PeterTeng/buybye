# == Schema Information
#
# Table name: messages
#
#  id           :uuid             not null, primary key
#  chat_room_id :uuid             not null
#  user_id      :uuid             not null
#  content      :text             not null
#  is_read      :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  #TODO add validation
end
