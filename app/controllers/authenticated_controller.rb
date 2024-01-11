class AuthenticatedController < ApplicationController
  before_action :redirect_to_login
  helper_method :current_user

  

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_to_login
    redirect_to login_path unless current_user
  end
end
