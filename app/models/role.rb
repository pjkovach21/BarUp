class Role < ActiveRecord::Base
  has_and_belongs_to_many :bars, :join_table => :bars_roles
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
end
