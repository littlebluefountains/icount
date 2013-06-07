class Account < ActiveRecord::Base
  #before_save :humanize_attributes

  attr_accessible :address, :email, :name, :phone, :subdomain, :website
  attr_accessible :owner_attributes

  validates :subdomain, uniqueness: true, presence: true
  validates :name, presence: true

  belongs_to :owner, class_name: "User"
  accepts_nested_attributes_for :owner

  has_many :users
  # has_many :accounts_users, class_name: "AccountsUser"
  # has_many :users, through: :accounts_users

  def self.create_with_owner(params={})
  	account = new(params)

  	#create_roles	#verify that roles exist
  	#admin_role = Role.where(name: "Admin")

  	if account.save
  		#account.owner.roles << admin_role	#assign admin role to the user

  		account.users << account.owner
  	end
  	account
  end

  def create_schema
  	#Apartment::Database.create(:subdomain)
    Apartment::Database.create(subdomain)
  end

  def owner?(user)
  	owner == user
  end

  private
  def self.create_roles
  	roles = Role.all
  	if roles.nil?
  		Role.create!([{name: "Admin"}, {name: "Manager"}, {name: "Sales_Person"}])
  	end
  end

  def humanize_attributes
    write_attribute(:name, read_attribute(:name).upcase!)
    write_attribute(:subdomain, read_attribute(:subdomain).downcase!)
    write_attribute(:address, read_attribute(:address).humanize) unless read_attribute(:address).blank?
    write_attribute(:website, read_attribute(:website).downcase!) unless read_attribute(:website).blank?
    write_attribute(:email, read_attribute(:email).humanize) unless read_attribute(:email).blank?
  end

end
