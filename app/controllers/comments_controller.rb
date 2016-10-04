class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    render nothing: true
    @comment = Comment.new permit_params
    if @comment.save
      redirect_to :back
    else
      redirect_to :back(flash[:danger] = "不正なコメントです")
    end
  end

  def edit
  end

  def update
    @comment.update permit_params
    redirect_to :back
  end

  private def permit_params
    params.
      require(:comment).
        permit(
          :user_id,
          :content,
        )
  end

  private def set_comment
    @comment = Comment.find  params[:id]
  end
end
