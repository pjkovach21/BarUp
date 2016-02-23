class LocationsController < ApplicationController
	def new
		@neighborhood = Location.neighborhood.all
	end
end
