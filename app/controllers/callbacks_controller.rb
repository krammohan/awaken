class CallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])
    if @user
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
      render "home/profile"
    else
      redirect_to new_user_session_path, notice: 'Access Denied.'
    end
  end
end
