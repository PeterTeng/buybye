class ChatRoomsController < ApplicationController

  before_action :private_chat_room_except_admin!, only: [:show]

  layout "chat"

  def show
    @chat_room = ChatRoom.find(params[:id])
    @item      = Item.includes(:user).includes(:buyer).find @chat_room.item_id
    @exhibitor = @item.user
    @buyer     = @item.buyer
    @message   = Message.new
    @messages  = @chat_room.messages.includes(:user).order created_at: :desc
  end


  private def private_chat_room_except_admin!
    user_ids = ChatRoom.find(params[:id]).users.pluck(:user_id)
    unless current_user.admin || user_ids.include?(current_user.id)
      not_found
    end
  end
end
