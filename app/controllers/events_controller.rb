require 'Date'
class EventsController < ApplicationController
	before_action :check_if_can_create_event, only: [:new, :create]
	before_action -> (id = params[:id]) { check_if_can_edit_or_destroy(id)}, only: [:edit, :update, :destroy]

	def show
		@event = Event.find(params[:id])
	end

	def new
		@bar = current_bar
		@event = @bar.events.new
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

	private

	def check_if_can_create_event
		unless current_bar && (current_bar.has_role?(:admin) || current_bar.has_role?(:author))
			
		end
	end

	def check_if_can_edit_or_destroy
		event = Event.find_by_id(event_id)
		unless current_bar && (cuurent_user.has_role?(:admin) || current_bar.has_role?(:event_author, post))
			redirect_to "/posts", warning: "you cant do this"
			
		end
	end
	def event_params
      params.require(:event).permit(:title, :date, :description)
    end
	
end
