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

  # Convenience method for conditionally displaying the
  # complaint form
  def user_signed_in?
    !!current_user
  end

  ## Make these methods available in the view as helpers
  helper_method :current_user, :user_signed_in?

end
