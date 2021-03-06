require 'Date'
class EventsController < ApplicationController
	before_action :check_if_can_create_event, only: [:new, :create]
	before_action -> (id = params[:id]) { check_if_can_edit_or_destroy(id)}, only: [:edit, :update, :destroy]
	skip_before_filter  :verify_authenticity_token



	def show
		@event = Event.find(params[:id])
		@followerCount = @event.followers_count
	end

	def new
		@bar = current_bar
		@event = @bar.events.new
		@event.location = Location.new
	end

	def index
		@events = Event.all
		
	end

	def edit
		@event= Event.find_by_id(params[:id])
	end

	def create
		@bar = current_bar
		@event = current_bar.events.new(event_params)

		if @event.save
			@bar.add_role :event_author, @event
			redirect_to @event, notice: "Event was uploaded"
		else
			render :new
		end

  	end

  	def update
  		@bar = current_bar
  		@event = current_bar.events.find_by_id(params[:id])
  		if @event.update(event_params)
  			redirect_to @event, notice: "You changed the details"
  		else
  			render :edit
  		end
  	end


  	def destroy
  		@bar = current_bar
  		@event = current_bar.events.find_by_id(params[:id])
  		if @event.destroy
  			redirect_to events_url, notice: "that shit is gone"
  		else
  			redirect_to events_path, warning: "You can't do that"
  		end
	end

	def filter
		@events = Event.all

		if params[:filter] == "today"
			range = Date.today.beginning_of_day..Date.today.end_of_day
     	elsif 
     		params[:filter] == "tomorrow"
     		tomorrow = Date.today + 1
			range = tomorrow.beginning_of_day..tomorrow.end_of_day
		elsif 
			params[:filter] == "this_week"
			range = Date.today.beginning_of_day..Date.today.end_of_week
		elsif 
			params[:filter] == "this_month"
			range = Date.today.beginning_of_day..Date.today.end_of_month
		end	

		
     	 @filteredevents = Event.where(date: range)
     	# @filteredevents = []
     	# @events.each do |event|
     	# 	if event.date == range
     	# 		@filteredevents.push(event)
     	# 	end
     	

		render json: @filteredevents	
	end


	def follow
		@event = Event.find(params[:id])
		# @followerCount = @bar.followers_count
		current_user.follow(@event)
		
		render :json => { :count => @event.followers_count }
	end

	def unfollow
		@event  = Event.find(params[:id])
		current_user.stop_following(@event)

		render :json => { :count => @event.followers_count }
	end

	def followers_count
		@event  = Event.find(params[:id])
		@followerCount = @event.followers_count
		
	end

	def send_form
		@event = Event.find_by(id: params[:id])
		@event.followers.each do |follower|
		
			EventMailer.event_email(follower, params[:subject], params[:body]).deliver_now
		end

		redirect_to "/"
	end

	def email_form
		@event = Event.find_by(id: params[:id])
		render 'email_form'
		# @bar = current_bar
		
	end

		
     	 # @filteredevents = Event.where(date: range)
     	# @filteredevents = []
     	# @events.each do |event|
     	# 	if event.date == range
     	# 		@filteredevents.push(event)
     	# 	end
	# 	bar_loc = params[:barloc]
	# 	@rb = []
	# 	@bars_by_type.each do |bar|
	# 		bar.locations.each do |b|
	# 			if b.neighborhood.downcase == bar_loc.downcase
	# 				@rb.push(bar)
	# 			end
	# 		end
	# 	end


	# 	render json: @filteredevents	
	# end

	private

	def check_if_can_create_event
		unless current_bar && (current_bar.has_role?(:admin) || current_bar.has_role?(:author))
			
		end
	end

	def check_if_can_edit_or_destroy
		event = Event.find_by_id(event_id)
		unless current_bar && (current_user.has_role?(:admin) || current_bar.has_role?(:event_author, post))
			redirect_to "/posts", warning: "you cant do this"
			
		end
	end
	def event_params
      params.require(:event).permit(:title, :date, :description, :location_attributes => [:neighborhood, :location])
    end
	
end
