require 'Date'
class EventsController < ApplicationController

	def show
	end

	def new
		@event = Event.new
	end

	def index
		@events = Event.all
	
	end

	def edit

	end

	def create
    event_params = params.require(:event).permit(:title, :description, :date)
    @event = Event.new(event_params)

    unless @event.save
      render(:new)
    else
    	#where does this go
      redirect_to(events_path)
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

	def destroy

	end
end
