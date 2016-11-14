class LikeController < ApplicationController

  protect_from_forgery with: :null_session
  # before_action :set_user_item, only: [:create]
  # before_action :limited_like_count!(user, item), only: [:create]

  #TODO 一回以上のお気に入りをできなくする
  def create
    user = User.find params[:user_id]
    user.like!(params[:item_id])
    redirect_to :back
  end

  # private def limited_like_count!(item, user)
  #   if user.like.include?(user)
  #     binding.pry
  #     redirect_to :back, flash: { alert: 'すでにお気に入りに追加しています' }
  #   end
  # end
  #
  # private def set_user_item
  #   item = Item.find params[:item_id]
  #   user = User.find params[:user_id]
  # end
end
