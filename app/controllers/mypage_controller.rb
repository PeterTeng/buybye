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
    @trading = current_user
  end

  def inquiry
    @inquiry = Inquiry.new
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

  def card_information
    @stripe_params    = {
      "data-currency"          => "usd",
      "data-description"       => "buybye",
      "data-image"             => "/assets/buybye_icon_5.2.4-39e6030fce179f236a53c64cfd4f569749523a41fa363510e83e140a7a0c0ace.png",
      "data-key"               =>  Rails.application.secrets.stripe["publishable_key"],
      "data-locale"            => "auto",
      "data-name"              => "buybye",
      "data-email"             => current_user.email,
      "data-allow-remember-me" => "false",
      "data-panel-label"       => "送信",
      "data-label"             => "カード情報を更新する",
      :src                     => "https://checkout.stripe.com/checkout.js"
    }
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
