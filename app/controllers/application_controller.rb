class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def sign_in user
    cookies.permanent[:remember_token] = user.remember_user
    user.save
    @current_user = user
  end

  def current_user
    if cookies[:remember_token] != nil
      @current_user ||= User.find_by(remember_token: Digest::SHA1.hexdigest(cookies[:remember_token]))
    end
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end

  def logged_in?
    current_user
    if @current_user == nil
      return false
    else
      return true
    end
  end
end
