class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :destroy]

  layout "mypage"

  def show
    @item        = Item.find(params[:id])
    @exhibitor   = @item.user
    @other_items = @exhibitor.items.limit(6).includes(:item_image)
    @comment     = Comment.new
    @comments    = @item.comments.includes(:user)
  end

  def edit
  end

  def update
  end

  def new
    @item           = Item.new
    @collge         = College.first
    @depertments    = Depertment.all
    @undergraduates = Undergraduate.all
  end

  def create
    @item = current_user.items.new permit_params
    if @item.save
      redirect_to item_path @item
    else
      redirect_to :back, flash: { alert: "不正な情報です" }
    end
  end

  def destroy
  end

  private def set_item
    @item = Item.find params[:id]
  end

  private def permit_params
    params.
      require(:item).
        permit(
          :user_id,
          :name,
          :description,
          :college_id,
          :depertment_id,
          :undergraduate_id,
          :price,
          :preservation_status,
          :auther,
        )
  end
end
