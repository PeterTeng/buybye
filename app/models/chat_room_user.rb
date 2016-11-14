# == Schema Information
#
# Table name: chat_room_users
#
#  id           :uuid             not null, primary key
#  user_id      :uuid             not null
#  chat_room_id :uuid             not null
#

class ChatRoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
end
