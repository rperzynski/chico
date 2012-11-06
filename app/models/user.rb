class User < ActiveRecord::Base
  attr_accessible :password_digest, :username
	has_secure_password
end
