class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :dashboard]
  before_action :correct_user, only: [:edit, :update, :dashboard]

  # Activate term of use authentication
  # before_save :agree_with_term_of_user!, only: [:create]

  #TODO implement slack notitcation after save user data
  # after_save :slack_notification!, only: [:create]

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
    if @user.used_email?(@user.email) && @user.is_black_list?
      redirect_to new_user_path, flash: { alert: "すでに使われているメールアドレスです" }
    else
      if @user.save
        log_in @user
        remember @user
        NotifySlackWorker.new.perform("new user", ":beers:", "#{@user.name}" )
        redirect_to mypage_dashboard_path
      else
        redirect_to mypage_dashboard_path, flash: { alert: "メールアドレスかパスワードのいずれかが間違えております" }
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
          :agreement,
          :name,
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

  # private def slack_notification!
  #   NotifySlackWorker.new.perform("new user", ":beers:", "#{@user.name}" )
  # end

  private def agree_with_term_of_user!
    unless params[:something]
      redirect_to new_user_path, flash[:danger] = "利用規約に同意してください"
    end
  end
end
