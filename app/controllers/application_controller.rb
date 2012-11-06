class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_authentication
    # Check that the :user_id session variable is set;
    # if it is, the user gets to access whatever
    # controller action is being checked.
    # Otherwise...
    unless session[:user_id]
      # Grab the full path of the user's original request
      # before check_authentication kicked in...
      session[:request_url] = request.fullpath
      # Redirect to the login form...
      redirect_to new_session_url
    end
  end
end

