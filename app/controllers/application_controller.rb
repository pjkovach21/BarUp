class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 #what is this the respod_to :html

  protect_from_forgery with: :null_session
	


  #why did i have this?
   respond_to :html, :json






  private
  #  def after_sign_out_path_for(resource_or_scope)
  #   redirect_to "/"
  # end
end