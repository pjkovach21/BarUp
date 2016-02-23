class Location < ActiveRecord::Base
	belongs_to :bar
	# enum neighborhood: [:Brickell, :Wynwood, :South_Beach, :EdgeWater, :Coral_Gables, :Downtown]
end

