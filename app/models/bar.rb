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

    acts_as_commentable

    acts_as_followable

    rolify strict: true
  
    after_create :assign_default_role

    

    private

    def assign_default_role
      add_role(:default_user) if self.roles.blank?
    end
end