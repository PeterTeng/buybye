class MypageController < ApplicationController

  before_action :authenticated_user!

  layout "mypage"

  def dashboard
  end

  def notification
  end

  def to_do_list
  end

  def favorite_list
  end

  def ex_exhibiting
    @exhibitings = current_user.items.where transaction_status: 0
  end

  def ex_trading
    @tradings = current_user.items.where transaction_status: 1
  end

  def ex_settle
    @settleds = current_user.items.where transaction_status: 1
  end

  def pur_trading
  end

  def pur_past_trade
  end

  def reviews
  end

  def profile
  end

  def mail_password
  end

  def logout
  end

  private def authenticated_user!
    if logged_in?
      unless current_user.id == session[:user_id]
        redirect_to root_path
      end
    else
      redirect_to new_user_path
    end
  end
end
