class User < ActiveRecord::Base
  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #i removed acts as validatable, because troubles with uploading a picture, maybe try to put back in because i dont think it was the problem
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable


    acts_as_follower
    belongs_to :gallery
    has_many :comments
    has_many :registrations
    has_many :bars, through: :registrations
    has_many :event_registrations
    has_many :events, through: :event_registrations

    

end
