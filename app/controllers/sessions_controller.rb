class SessionsController < ApplicationController

  def create

    auth_hash = request.env['omniauth.auth']

    unless @auth = Authorization.find_from_hash(auth_hash)
      @auth = Authorization.create_from_hash(auth_hash, current_user)
    end

    self.current_user = @auth.user

    redirect_to request.env['omniauth.origin'] || root_url

  end

	def destroy
    reset_session
  	redirect_to root_url, :notice => "Logged out!"
	end

end












