class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def sign_in_as(user)
    session[:email] = user.email
  end
  
  def current_user
    @current_user ||= User.find_by(email: session[:email])
  end
  
end
