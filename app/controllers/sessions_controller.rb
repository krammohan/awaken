class SessionsController < ApplicationController
  
  def new
  	@user = current_user
  end

  def create
	user = User.from_omniauth(env["omniauth.auth"])
  user.access_token = request.env["omniauth.auth"].credentials.token
  user.refresh_token = request.env["omniauth.auth"].credentials.request_token
  user.save
	session[:user_id] = user.id
  p "BLAHLDKFJDSL:KFJDSLF:KJSDF:LKJSDFL:BSDFJKDSFHLKDSJFLFKDSJF"
  p request.env["omniauth.auth"]
  p "THIS IS THE END OF THE THING THAT WE ARE TRYAN PRITN"
	redirect_to "user#show"

  end

  def destroy
	session[:user_id] = nil
	redirect_to root_path
  end

end

# DO NOT CHANGE