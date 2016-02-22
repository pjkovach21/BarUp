class Location < ActiveRecord::Base
	has_many :bars
	enum neighborhood: [:Brickell, :Wynwood, :South_Beach, :EdgeWater, :Coral_Gables, :Coconut_Groce, :Downtown]
end

