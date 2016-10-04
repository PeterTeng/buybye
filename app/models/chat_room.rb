class ChatRoom < ApplicationRecord

  has_many :users, through: :chat_room_users

  def join(user_id)
    self.chat_users.create(user_id: user_id)
  end

  def conversation_partner(current_user)
    self.users.where.not(email: current_user.email)
  end
end
