class Admin::TradesController < Admin::BaseController

  def index
    @trade = Trade.all
  end

  def show
  end

  def refund
  end

end
