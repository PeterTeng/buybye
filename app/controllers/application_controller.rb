class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def authenticated_user
    current_user.correct_user?
  end
end
