class Admin::BlackListsController < Admin::BaseController

  def index
    @black_lists = BlackList.all
  end

end
