class MypageController < ApplicationController

  before_action :authenticated_user!

  def dashboard
  end

  def notification
  end

  def to_do_list
  end

  def favorite_list
  end

  def ex_exhibiting
  end

  def ex_trading
  end

  def ex_settle
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
    unless session[:user_id] == current_user.id
      redirect_to root_path
    end
  end
end
