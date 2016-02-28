class User < ActiveRecord::Base
  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    acts_as_follower

    has_many :comments
    has_many :registrations
    has_many :bars, through: :registrations
    has_many :event_registrations
    has_many :events, through: :event_registrations
end
