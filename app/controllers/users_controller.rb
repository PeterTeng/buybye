class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :dashboard]
  before_action :correct_user, only: [:edit, :update, :dashboard]

  layout :resolve_layout

  def dashboard
  end

  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new user_params
    if @user.used_email? @user.email
      redirect_to new_user_path, flash: { alert: "メールアドレスかパスワードのいずれかが間違えております" }
    else
      if @user.save
        log_in @user
        remember @user
        NotifySlackWorker.new.perform("", "", "")
        # SignUpNotifer.send_user(@user).deliver_now
        redirect_to root_path
      else
        render :new
      end
    end
  end

  private def resolve_layout
    unless action_name == "new"
      "application"
    else
      "registrate"
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
