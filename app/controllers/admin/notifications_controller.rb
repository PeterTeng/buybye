class Admin::NotificationsController < Admin::BaseController

  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  def index
    @notification = Notification.all
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def edit
  end

  def update
    if @notification.update set_notification
      redirect_to admin_notifications_path
    else
      redirect_to :back
    end
  end

  def create
    @notification = Notification.new permit_params
    if @notification.save
      redirect_to admin_notifications_path
    else
      redirect_to :back
    end
  end

  def destroy
    @notification.destroy
    redirect_to :back
  end

  private def set_notification
    @notification = Notification.find params[:id]
  end

  private def permit_params
    params.
      require(:notification).
        permit(
          :title,
          :content,
          :is_read
        )
  end
end
