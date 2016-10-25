class Admin::UsersController < Admin::BaseController

  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.where is_disabled: false
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to :back
  end

  private def set_user
    @user = User.find params[:id]
  end
end
