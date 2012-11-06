class SessionsController < ApplicationController
  # GET /login => sessions#new
  def new
    # Check for :user_id in the session variable;
    # If it's set, return to the pages listing
    # Otherwise, the /views/sessions/new.html.erb
    # page will be rendered (that's the login form)
    # by default/convention, so we don't even
    # have to write that code in this controller action:
    if session[:user_id]
      redirect_to pages_path
    end
  end

  # POST /login => sessions#create
  def create
    # Find user using the .authenticate class method setup
    # in /app/models/user.rb
    user = User.authenticate(params[:username],params[:password])

    # If a valid, authenticated user is returned, set up
    # the session variables:
    if user
      session[:user_id] = user.id # User ID for the session
      flash[:notice] = "Welcome back!" # Welcome notice

      # Now see if there's a request URL session variable
      # as set in check_authentication method of the
      # application-wide controller
      # (app/controllers/application_controller.rb).
      # If there is, redirect to it. Otherwise, just show
      # the Pages listing.
      if session[:request_url]
        redirect_to session[:request_url]
      else
        redirect_to pages_url
      end
    # If there is no valid, authenticated user returned,
    # flash a notice and redirect to the new_session_url,
    # e.g., /login & the login form (/views/session/new.html.erb):
    else
      flash[:notice] = "Username or password is incorrect"
      redirect_to new_session_url
    end
  end

  # DELETE /logout => sessions#destroy
  def destroy
    reset_session # Use the reset_session method to
                  # wipe all session variables
    redirect_to pages_url # Redirect to the Pages listing
  end
end
