class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  #scopify

  attr_accessible :name
  validates :name, presence: true
end
