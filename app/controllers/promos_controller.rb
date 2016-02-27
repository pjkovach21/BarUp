class PromosController < ApplicationController
before_action :check_if_can_create_promo, only: [:new, :create]
	before_action -> (id = params[:id]) { check_if_can_edit_or_destroy(id)}, only: [:edit, :update, :destroy]

	def show
		@promo = Promo.find(params[:id])
	end

	def new
		@bar = current_bar
		@promo = @bar.promos.new

	end

	def index
		@promos = Promo.all
		
	end

	def edit
		@promo= Promo.find_by_id(params[:id])
	end

	def create
		@bar = current_bar
		@promo = current_bar.promos.new(promo_params)

		if @promo.save
			@bar.add_role :promo_author, @promo
			redirect_to @promo, notice: "promo was uploaded"
		else
			render :new
		end

  	end

  	def update
  		@bar = current_bar
  		@promo = current_bar.promos.find_by_id(params[:id])
  		if @promo.update(promo_params)
  			redirect_to @promo, notice: "You changed the details"
  		else
  			render :edit
  		end
  	end


  	def destroy
  		@bar = current_bar
  		@promo = current_bar.promos.find_by_id(params[:id])
  		if @promo.destroy
  			redirect_to promos_url, notice: "that shit is gone"
  		else
  			redirect_to promos_path, warning: "You can't do that"
  		end
	end

	private

	def check_if_can_create_promo
		unless current_bar && (current_bar.has_role?(:admin) || current_bar.has_role?(:author))
			
		end
	end

	def check_if_can_edit_or_destroy
		promo = Promo.find_by_id(promo_id)
		unless current_bar && (current_user.has_role?(:admin) || current_bar.has_role?(:promo_author, post))
			redirect_to "/posts", warning: "you cant do this"
			
		end
	end
	def promo_params
      params.require(:promo).permit(:title, :date, :description)
    end
	
end


# , :location_attributes => [:neighborhood, :location]
# for search by neighborhood
