class PromosController < ApplicationController
before_action :check_if_can_create_event, only: [:new, :create]
	before_action -> (id = params[:id]) { check_if_can_edit_or_destroy(id)}, only: [:edit, :update, :destroy]

	def show
		@event = Event.find(params[:id])
		@followCount = @event.followers_count
	end

	def new
		@bar = current_bar
		@event = @bar.promos.new
		@event.location = Location.new
	end

	def index
		@promos = Event.all
		
	end

	def edit
		@event= Event.find_by_id(params[:id])
	end

	def create
		@bar = current_bar
		@event = current_bar.promos.new(event_params)

		if @event.save
			@bar.add_role :event_author, @event
			redirect_to @event, notice: "event was uploaded"
		else
			render :new
		end

  	end

  	def update
  		@bar = current_bar
  		@event = current_bar.promos.find_by_id(params[:id])
  		if @event.update(event_params)
  			redirect_to @event, notice: "You changed the details"
  		else
  			render :edit
  		end
  	end


  	def destroy
  		@bar = current_bar
  		@event = current_bar.promos.find_by_id(params[:id])
  		if @event.destroy
  			redirect_to promos_url, notice: "that shit is gone"
  		else
  			redirect_to promos_path, warning: "You can't do that"
  		end
	end

	private

	def check_if_can_create_event
		unless current_bar && (current_bar.has_role?(:admin) || current_bar.has_role?(:author))
			
		end
	end

	def check_if_can_edit_or_destroy
		event = event.find_by_id(event_id)
		unless current_bar && (current_user.has_role?(:admin) || current_bar.has_role?(:event_author, post))
			redirect_to "/posts", warning: "you cant do this"
			
		end
	end
	def event_params
      params.require(:event).permit(:title, :date, :description, :location_attributes => [:neighborhood, :location])
    end
	
end

