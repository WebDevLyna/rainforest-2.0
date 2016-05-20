class SessionsController < ApplicationController
  def new
    # We don't have to instantiate a user object in our new action because we are only logging in, not creating a new user.
  end

  def create
    # We find a user by the email typed in the email input field
    # and assign it to the variable 'user'
    user = User.find_by(email: params[:email])
    # We check if that user exists and that it can be authenticated with
    # the password typed in the password input field
    if user && user.authenticate(params[:password])
      # If both of those evaluate to 'true', we create a key-value pair in
      # the session hash. ':user_id' is the key and the user's id is the value
      session[:user_id] = user.id
      # The session key has been assigned, the user is redirected
      # to the products index page
      redirect_to products_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email/password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "Logged out!"
  end

end
