class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.channel
      user_path(current_user) || request.env['omniauth.origin'] || stored_location_for(resource)
    else
      current_user.set_channel
      user_path(current_user) || request.env['omniauth.origin'] || stored_location_for(resource)
    end
  end

end
