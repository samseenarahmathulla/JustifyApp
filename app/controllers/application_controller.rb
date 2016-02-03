class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # ADD extra fields like name and role in users table for registration
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # show the validations
  
  
  
  def after_sign_in_path_for(resource)
    if resource[:role_id] == 2
      store_location_for(resource, client_path(resource[:id]))
    elsif resource[:role_id] == 3
      store_location_for(resource, lawyer_path(resource[:id]))
    elsif resource[:role_id] == 4
      store_location_for(resource, lawfirm_path(resource[:id]))
    end
    
    stored_location_for(resource) || root_path
    # request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end  
  
end
