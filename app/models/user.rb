class User < ActiveRecord::Base
  has_many :reviews
  has_many :products, through: :reviews
  # This will auto add "attr_accessor :password, :password_confirmation" in model
  has_secure_password
end
