class SessionsController < ApplicationController



def create

   auth_hash = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth_hash)
      @auth = Authorization.create_from_hash(auth_hash, current_user)
   end
  self.current_user = @auth.user
redirect_to request.env['omniauth.origin'] || root_url
 
end

#  def create  
 #   auth = request.env["omniauth.auth"]  
#    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)  
#    session[:user_id] = user.id  
#    redirect_to root_url, :notice => "Signed in!"  
#  end 




	def destroy
 	 session[:user_id] = nil
  	redirect_to root_url
	end

	def failure
 		 render :text => "Sorry, but you didn't allow access to our app!"
	end

end
    
     #    if auth.user
     # session[:user_id] = user.id # User ID for the session
			#session[:user_name] = user.username
    #  flash[:notice] = "Welcome back!" # Welcome notice

      # Now see if there's a request URL session variable
      # as set in check_authentication method of the
      # application-wide controller
      # (app/controllers/application_controller.rb).
      # If there is, redirect to it. Otherwise, just show
      # the Pages listing.
  #    if session[:request_url]
  #      redirect_to session[:request_url]
 #     else
 #      current_user_path
  #    end
    # If there is no valid, authenticated user returned,
    # flash a notice and redirect to the new_session_url,
    # e.g., /login & the login form (/views/session/new.html.erb):
    #else
    # # flash[:notice] = "Username or password is incorrect. Please try again."
   #   redirect_to new_session_url
   # end
      
    # If there is no valid, authenticated user returned,
    # flash a notice and redirect to the new_session_url,
    # e.g., /login & the login form (/views/session/new.html.erb):
     


   











