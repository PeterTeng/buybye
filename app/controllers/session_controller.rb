class SessionController < ApplicationController
  def new
  end

  def create
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      redirect_to login_path(flash[:danger] = 'メールアドレスかパスワードのいずれかが間違えております')
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
