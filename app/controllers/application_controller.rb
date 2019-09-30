# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def sign_in_as(user)
    cookies.signed[:email] = user.email
  end

  def current_user
    @current_user ||= User.find_by(email: cookies.signed[:email])
  end

  def log_out
    @current_user = nil
    cookies.signed[:email] = nil
  end
end
