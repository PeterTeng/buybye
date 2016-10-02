class UsersController < Admin::BaseController

  before_action :set_user, only: [:show, :destroy]

  def show
  end

  def destroy
    @user.destroy
    redirect_to
  end

  private def set_user
    @user = User.find params[:id]
  end
end
