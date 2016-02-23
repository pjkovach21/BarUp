class BarsController < ApplicationController
	def index
		@bars= Bar.all
	end
	def bars
		@bars = Bar.all
		render json: @bars
	end

	def show
		@bar = Bar.find(params[:id])
	end
end
