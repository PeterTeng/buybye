class Admin::ItemsController < Admin::BaseController

  before_action :set_item, only: [:destroy, :warning, :unreported]

  def index
    @items = Item.all.includes(:user).where(users: { is_disabled: false })
  end

  def warning
    @item.user.notifications.create(
      status: 0
    )
    redirect_to :back, flash: {success: "ユーザに警告しました"}
    @item.user.auto_delete
  end

  def destory
    # @item.user.
    @item.destroy
    redirect_to :back
  end

  def unreported
    @item.update(
      reported: false
    )
    redirect_to :back, flash: {success: "報告を解除しました"}
  end

  private def set_item
    @item = Item.find params[:id]
  end

end
