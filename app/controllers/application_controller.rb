class ApplicationController < ActionController::Base
  protected



 # def current_user
 #   @current_user ||= User.find_by_id(session[:user_id])
 # end

def current_user=(user)
  @current_user = user
  session[:user_id] = user.id
end

#Blocked out 

#def current_user=(user)
#  @current_user ||= User.find(session[:user_id]) if session[:user_id]  
#  session[:user_id] = user.id
#end



  def signed_in?
    !!current_user
  end

	def after_sign_in_path_for(resource)
    current_user_path
  end

  helper_method :current_user

private

def current_user=(user)
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

 before_filter :get_session_user


  def get_session_user
    @user ||= 
      session[:user_id] &&
      User.find_by_id(session[:user_id])
  end


end
