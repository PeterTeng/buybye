class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # before_action :authenticated_user!

  include SessionsHelper


  def sign_in!
    redirect_to new_user_path unless current_user
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
