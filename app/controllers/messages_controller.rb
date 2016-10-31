class MessagesController <ApplicationController

  def create
    @message = Message.create message_params
    redirect_to :back
  end

  private def message_params
    params.
      require(:message).
       permit(
         :chat_room_id,
         :user_id,
         :content
       )
  end

end
