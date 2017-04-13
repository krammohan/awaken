class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2

    $code_for_cal = params[:code]

    login request.env["omniauth.auth"]


  end

  private

  def login auth_hash

    @user = User.from_omniauth(auth_hash)
    @user.access_token = request.env["omniauth.auth"].credentials.token
    @user.refresh_token = request.env["omniauth.auth"].credentials.request_token
    @user.save

    p "BLAHLDKFJDSL:KFJDSLF:KJSDF:LKJSDFL:BSDFJKDSFHLKDSJFLFKDSJF"
    p request.env["omniauth.auth"]
    p "THIS IS THE END OF THE THING THAT WE ARE TRYAN PRITN"

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "#{auth_hash.provider}") if is_navigational_format?
    else
      session["devise.#{auth_hash.provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

  end

end
