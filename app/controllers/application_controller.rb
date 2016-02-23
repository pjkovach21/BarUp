class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 #what is this
 respond_to :html, :json
  protect_from_forgery with: :null_session
	
  before_action :configure_permitted_parameters, if: :devise_controller?



 protected
   #username is not required
   def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
      # params.require(resource_name).permit!
  end
end