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
    event_params = params.require(:event).permit(:title, :decription, :date)
    @event = Event.new(event_params)

    unless @event.save
      render(:new)
    else
    	#where does this go
      redirect_to(events_path)
    end
  end

	def destroy

	end
end
