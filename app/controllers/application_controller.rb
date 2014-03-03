class ApplicationController < ActionController::Base
  before_filter :authenticate

  def authenticate
    return if session[:user] || Settings.authentication.blank?
    session[:return_to] = request.fullpath
    redirect_to "/auth/#{Settings.authentication.provider}"
  end

  # Respond to HTML by default
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
