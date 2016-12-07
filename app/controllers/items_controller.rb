class ItemsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  before_action :set_item, only: [:edit, :update, :destroy, :report, :purchase]
  before_action :sign_in!, only: [:new, :show, :purchase]
  # before_action :different_user!(), only: [:purchase]

  layout "mypage"

  def show
    current_user  = current_user.includes(:items) if current_user
    @item         = Item.includes(:item_images).includes(:user).includes(:college).includes(:depertment).includes(:undergraduate).find(params[:id])
    @exhibitor    = @item.user
    @other_items  = @exhibitor.items.limit(6).includes(:item_image)
    @comment      = Comment.new
    @comments     = @item.comments.includes(:user)
    # @review_count = @user.good_evaluation_count +
  end

  def edit
  end

  def update
  end

  def new
    #TODO implement js autocomplete
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
    render nothing: true
    @item.destroy
  end

  def search
  end

  def report
    @item.update(
      reported: true
    )
    redirect_to :back
  end

  def report_succeeded
  end

  def purchase
    CreateNewChatService.call(@item.id, current_user.id, @item.user.id)
    update_item_after_pucahsed!(@item)
    CreateTradeService.exec(@item, current_user, @item.user)
    # TODO この2つの処理はdelayed jobをかませたい
    NotifySlackWorker.new.perform('transaction succeeded', ':congratulations:','取引が行われました')
    CreateBillingService.call(@item, current_user)
    redirect_to root_path
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
          :row_price,
          :price_with_margin,
          :preservation_status,
          :auther,
          :created_at,
        )
  end

  private def sign_in!
    redirect_to new_user_path unless current_user
  end

  private def different_user!(message)
    redirect_to :back, flash[:danger] = message
  end

  private def update_item_after_pucahsed!(item)
    item.update(
      sold_at: Date.today,
      buyer_id: current_user.id,
      transaction_status: 1,
    )
  end
end
