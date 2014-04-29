class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    # Set some session variables
    session[:user_id] = user.id
    session[:name] = user.name
  end

end
