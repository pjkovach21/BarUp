class BarsController < ApplicationController
	skip_before_filter :verify_authenticity_token


	def index
		@bars= Bar.all
		

	end
	def bars
		@bars = Bar.all


		bar_type = params[:bartype]
		@bars_by_type = []
		@bars.each do |bar|
			if bar.bar_type.downcase == bar_type.downcase
				@bars_by_type.push(bar)
			end
		end
		bar_loc = params[:barloc]
		@rb = []
		@bars_by_type.each do |bar|
			bar.locations.each do |b|
				if b.neighborhood.downcase == bar_loc.downcase
					@rb.push(bar)
				end
			end
		end


		render json: @rb
	end

	def send_form
		@bar = Bar.find_by(id: params[:id])
		@bar.followers.each do |follower|
		
			BarMailer.bar_email(follower, params[:subject], params[:body]).deliver_now
		end

		redirect_to "/"
	end

	def email_form
		@bar = Bar.find_by(id: params[:id])
		# @bar = current_bar
		
	end

	def show
		@bar = Bar.find(params[:id])
		@followerCount = @bar.followers_count

		if current_user
		 @new_comment = Comment.build_from(@bar, current_user.id, "")
		end
		#@all_comments = @bar.comment_threads

	end


	def follow
		@bar = Bar.find(params[:id])
		# @followerCount = @bar.followers_count
		current_user.follow(@bar)
		
		render :json => { :count => @bar.followers_count }
	end

	def unfollow
		@bar  = Bar.find(params[:id])
		current_user.stop_following(@bar)

		render :json => { :count => @bar.followers_count }
	end

	def followers_count
		@bar  = Bar.find(params[:id])
		@followerCount = @bar.followers_count
		
	end

	def create
		@bar = Bar.create(bar_params)
	end

	private
	def bar_params
		params.require(:bar).permit(:avatar)
	end

	

		


end
