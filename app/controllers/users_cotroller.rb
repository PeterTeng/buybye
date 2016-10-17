class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :become_guide, :dashboard]
  before_action :correct_user, only: [:edit, :update, :dashboard]

  def dashboard
  end

  def new
    if logged_in?
      redirect_to user_path current_user
    else
      @user = User.new
    end
  end

  def create
    @user = User.new user_params
    if @user.used_email? @user.email
      redirect_to new_user_path(flash[:danger] = 'this email address is already used')
    else
      if @user.save
        log_in @user
        remember @user
        # SignUpNotifer.send_user(@user).deliver_now
        redirect_to dashboard_user_path @user
      else
        render :new
      end
    end
  end

  private def set_user
    @user = User.find params[:id]
  end

  private def user_params
    params.
      require(:user).
        permit(
          :email,
          :password_digest,
          :remember_digest,
          :password,
          :introduce,
          :gender,
          :undergraduate,
          :department,
        )
  end

  private def correct_user
    @user = User.find params[:id]
    redirect_to dashboard_user_path @user unless correct_user? @user
  end

end
