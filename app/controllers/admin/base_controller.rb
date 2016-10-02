class Admin::BaseController < ApplicationController

  http_basic_authenticate_with name: "buybye", password: "uooosugeee"
  before_action :authenticated_admin!

  private def authenticated_admin!
    redirect_to :root_path unless current_user.try(:admin?)
  end

end
