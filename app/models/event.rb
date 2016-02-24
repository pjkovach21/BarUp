class Event < ActiveRecord::Base
		resourcify
	belongs_to :bar
	has_many :event_registrations
	has_many :users, through: :event_registrations

end
