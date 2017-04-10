class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
  	login request.env["omniauth.auth"]
  end

  private

  def login auth_hash

    @user = User.from_omniauth(auth_hash)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "#{auth_hash.provider}") if is_navigational_format?
    else
      session["devise.#{auth_hash.provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

  end
  
end