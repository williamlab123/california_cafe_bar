# frozen_string_literal: true

module SimpleAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :redirect_to_login
    helper_method :current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_to_login
    redirect_to '/login' unless current_user
  end
end
