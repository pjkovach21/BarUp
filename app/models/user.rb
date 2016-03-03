class User < ActiveRecord::Base
  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable


    acts_as_follower
    belongs_to :gallery
    has_many :comments
    has_many :registrations
    has_many :bars, through: :registrations
    has_many :event_registrations
    has_many :events, through: :event_registrations

    mount_uploader :avatar, AvatarUploader

end
