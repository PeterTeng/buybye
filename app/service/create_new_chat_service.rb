class CreateNewChatService
  def self.call(item_id, buyer_id, exhibitor_id)
    new_chat = ChatRoom.create item_id: item_id
    new_chat.join buyer_id
    new_chat.join exhibitor_id
    return new_chat
  end
end
