class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 respond_to :html, :json
  protect_from_forgery with: :exception
	
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

end
