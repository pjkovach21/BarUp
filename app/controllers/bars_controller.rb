class BarsController < ApplicationController
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

	def show
		#@bar = Bar.find(params[:id])
	end
end
