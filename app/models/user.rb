class User < ActiveRecord::Base
  attr_accessible :password_digest, :username
  has_secure_password


  # Create a class method for authentication
  # that will be used on the Sessions controller.
  # Takes username & password from the login form.

  def self.authenticate(username,password)
    # Query the database for the username first:
    user = User.find_by_username(username)

    # Unless the user exists and the password is
    # good, return nil and let the Sessions controller
    # handle the error:
    unless user && user.authenticate(password)
      nil
    else
      # Otherwise, return the authenticated user:
      user
    end
  end
end

