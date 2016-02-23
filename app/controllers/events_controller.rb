class EventsController < ApplicationController
	def show
	end

	def new
		@event = Event.new
	end

	def index
		@events = Event.all

		@today = DateTime.today.beginning_of_day..DateTime.today.end_of_day

		nextday = Date.today + 1.day
		@tomorrow = nextday.beginning_of_day..nextday.end_of_day

		@this_week = Date.today..Date.today.at_end_of_week

		@this_month = Date.today..Date.today.at_end_of_month

		
		
		# today_range = Date.today.beginning_of_day..Date.today.end_of_day
  #    	@today=@events.where(start_date: today_range)
		
		# nextday = Date.today + 1.day
		# tomorrow_range = nextday.beginning_of_day..nextday.end_of_day
		# @tomorrow = @events.where(start_date: tomorrw_range)

		# week_range = Date.today..Date.today.at_end_of_week
  #    	@this_week=@events.where(start_date: week_range)
     	
  #    	month_range = Date.today..Date.today.at_end_of_month
  #    	@this_month = @events.where(start_date: month_range)
	end

	def edit

	end

	def create
    event_params = params.require(:event).permit(:title, :decription, :date)
    @event = Event.new(event_params)

    unless @event.save
      render(:new)
    else
    	#where does this go
      redirect_to(events_path)
    end
  end

  	def event
		@event = Event.all

		render json: @event
	end

	def destroy

	end
end
