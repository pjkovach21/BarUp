class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 #what is this the respod_to :html

  protect_from_forgery with: :null_session
	
  before_action :configure_permitted_parameters, if: :devise_controller?

  #why did i have this?
   respond_to :html, :json



 protected
   #username is not required
   def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :avatar)}
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :avatar)}
      # params.require(resource_name).permit!
  end



  private
  #  def after_sign_out_path_for(resource_or_scope)
  #   redirect_to "/"
  # end
end