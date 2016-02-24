class UsersController < ApplicationController
	

	def show
		@user = User.find_by(id: params[:id])
	end

	def destroy
		render "/"
	end
end
