class Event < ActiveRecord::Base
	resourcify
	belongs_to :bar
	has_many :event_registrations
	has_many :users, through: :event_registrations
	belongs_to :location
	accepts_nested_attributes_for :location
	acts_as_followable

end
