class BarsController < ApplicationController
	def index
		@bars= Bar.all
	end
	def bars
		@bars = Bar.all
		render json: @bars
	end
end
