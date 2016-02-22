class Event < ActiveRecord::Base
	belongs_to :bar
	has_many :users, through: :event_registrations
end
