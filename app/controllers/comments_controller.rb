class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new permit_params
    @comment.save
    redirect_to :back
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
          :item_id,
          :user_id,
          :content,
        )
  end

  private def set_comment
    @comment = Comment.find  params[:id]
  end

end
