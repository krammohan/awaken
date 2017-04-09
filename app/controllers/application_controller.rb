class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def after_sign_in_path_for(resource)
  #   request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  # end

  def after_sign_up_path_for(resource)
   signed_in_root_path(resource)
  end

  def stored_location_for(resource)

  end
end
