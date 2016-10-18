class SessionController < ApplicationController

  layout :resolve_layout

  def new
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      redirect_to login_path, flash: { alert: "メールアドレスかパスワードのいずれかが間違えております" }
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private def resolve_layout
    unless action_name == "new"
      "application"
    else
      "registrate"
    end
  end

end
