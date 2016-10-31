class Admin::BaseController < ApplicationController

  # Activate admin authentication
  # http_basic_authenticate_with name: "buybye", password: "uooosugeee"
  # before_action :authenticated_admin!

  layout "admin"

  private def authenticated_admin!
    unless current_user.try(:admin?)
      not_found
    end
  end

end
