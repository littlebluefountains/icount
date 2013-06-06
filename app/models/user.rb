require 'role_model'

class User < ActiveRecord::Base
  #scopes
  scope :account_users, lambda { |id| where("users.account_id = ?", id) }
  #before_save :set_account

  #rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :registerable,
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :basecamper #,
         #request_keys: [:subdomain] #for restricting login to a specific subdomain

  include RoleModel #for role_model

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me  #, :role_ids   #was for rolify
  # attr_accessible :title, :body
  attr_accessible :roles, :roles_mask, :super_admin   #forl role_model

  validates :email, :uniqueness => true
  validates :username, :uniqueness => true
  validates :username, presence: true

  # has_one :accounts_user, class_name: "AccountsUser"
  # has_one :account, through: :accounts_user
  belongs_to :account

  #for Canard / RoleModel
  roles_attribute :roles_mask   #optional, already set by default

  roles :sales, :manager, :admin, :super_admin

  #acts_as_user :roles => :sales, :manager, :admin, :super_admin 
  #super_admin = can access gal site to create accounts
  #admin = user specific admin for each account
  #manager = manager for each account
  #sales = sales for each account


  #added to restrict login to subdomains
  # def self.find_for_authentication(warden_conditions)
  #   if subdomain = Subdomain.find_by_name(warden_conditions[:subdomain])
  #     subdomain.users.find_by_email(warden_conditions[:email])   
  #   end
  # end

  #define method to return roles as string
  def self.roles_as_string
     valid_roles.map { |s| [s.to_s.humanize, s] }
  end 

  def self.get_roles(bool_value)
    if bool_value
      valid_roles.map { |s| [s.to_s.humanize, s] }
    else
      #valid_roles.map { |s| [s.to_s.humanize, s] if s.to_s != "super_admin" }
      #use the reject method to remove the uper_admin option
      valid_roles.reject { |s| s.to_s == "super_admin"}.map { |s| [s.to_s.humanize, s] }
    end
    
  end

  # def self.account_users(subdomain)
  #   #joins(:account).where(:account => {subdomain: subdomain})
  #   joins(:account).where("user.account.subdomain = ?", subdomain)
  # end

  #private
  # def self.user_roles
  #   read_attribute(:roles).map { |s| [s.to_s.humanize, s] }
  # end

  def set_account(account_id)
    #set the account to the account of the logged in user
    #write_attribute(:account_id, current_account.id)  if current_user.username != "gal_admin"
    write_attribute(:account_id, account_id) 
  end

  def role_name
    #roles[role_id]
    #valid_roles.reject { |s| s.roles_mask != role_id }.map { |s| [s.to_s.humanize, s] }
    roles.map { |s| s.to_s.upcase }
  end
end
