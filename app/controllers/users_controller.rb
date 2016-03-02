class UsersController < ApplicationController
	

	def show
		@user = User.find_by(id: params[:id])
		@following = @user.all_following

		render "show"
	end
	def unfollow
		@bar  = Bar.find(params[:id])
		current_user.stop_following(@bar)

		render :json => { :count => @bar.followers_count }
	end



end


