class InquiriesController < ApplicationController

  def create
    inquiry = Inquiry.create permit_params
    message = <<-EOS
    user_email: #{inquiry.user.email}
    user_name : #{inquiry.user.name}
    名前: #{inquiry.nickname}
    タイトル: #{inquiry.title}
    内容: #{inquiry.content}
    EOS
    redirect_to root_path
    NotifySlackWorker.new.perform("inquiry!!", ":telephone_receiver:", message.sub(/\n$/, ''))
  end

  private def permit_params
    params.
      require(:inquiry).
        permit(
          :user_id,
          :content,
          :title,
          :nickname,
        )
  end
end
