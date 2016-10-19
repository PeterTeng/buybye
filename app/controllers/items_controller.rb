class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  layout "mypage"

  def show
    @exhibitor   = @item.user
    @other_items = @exhibitor.items.limit(6)
  end

  def edit
  end

  def update
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new permit_params
    if @item.save
      redirect_to
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
          :price,
          :preservation_status,
          :auther,
        )
  end
end
