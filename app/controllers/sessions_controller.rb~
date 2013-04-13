class SessionsController < ApplicationController



 def create
    
   auth = request.env['omniauth.auth']

    unless @auth = Authorization.find_from_hash(auth)
      @auth = Authorization.create_from_hash(auth, current_user)
    end

    self.current_user = @auth.user  
    render :text => "Welcome"
   end
end


#	def destroy
# 	 session[:user_id] = nil
#  	render :text => "You've logged out!"
#	end

#	def failure
# 		 render :text => "Sorry, but you didn't allow access to our app!"
#	end

#end





