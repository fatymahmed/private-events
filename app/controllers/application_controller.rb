class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def sign_in_as(user)
    cookies.signed[:email] = user.email
  end
  
  def current_user
    @current_user ||= User.find_by(email: cookies.signed[:email])
  end
  
end
