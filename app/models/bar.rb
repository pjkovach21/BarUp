class Bar < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :registrations
    has_many :users, through: :registrations
    has_many :promos
    has_many :events
    enum bar_type: [:College, :Dive, :Dance, :Club, :Cocktail, :Hotel]
    has_many :locations
    accepts_nested_attributes_for :locations
end