class UsersController < ApplicationController
	

	def show
		@user = User.find_by(id: params[:id])
		@following = @user.all_following
	end




end
