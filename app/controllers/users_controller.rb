class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token

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

	def create
		@username = User.create(user_params)
	end

	private
	def user_params
		params.require(:user).permit(:avatar)
	end


end


