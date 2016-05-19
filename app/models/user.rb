class User < ActiveRecord::Base
  # This will auto add "attr_accessor :password, :password_confirmation" in model
  has_secure_password
end
