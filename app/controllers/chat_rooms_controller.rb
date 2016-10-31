class ChatRoomsController < ApplicationController

  before_action :private_chat_room_except_admin!, only: [:show]

  layout "chat"

  def show
    @chat_room = ChatRoom.includes(users: [:messages]).includes(:messages).find params[:id]
    @item      = Item.includes(:item_images).includes(:user).includes(:buyer).find @chat_room.item_id
    @exhibitor = @item.user
    @buyer     = @item.buyer
    @message   = Message.new
    @messages  = @chat_room.messages.order created_at: :desc
  end


  private def private_chat_room_except_admin!
    unless current_user.admin || ChatRoom.find(params[:id]).users.include?(current_user)
      not_found
    end
  end
end
