class Tenant < ActiveRecord::Base
  attr_accessible :subdomain
  after_create :create_schema

  validates :subdomain, uniqueness: true

  #FROM RAILSCASTS
  def create_schema
  	connection.execute("create schema tenant#{id}")
  	scope_schema do
  		load Rails.root.join("db/schema.rb")
  		connection.execute("drop table #{self.class.table_name}")
  	end
  end

  def scope_schema(*paths)
  	original_search_path = connection.schema_search_path
  	connection.schema_search_path = ["tenant#{id}", *paths].join(",")
  	yield
  ensure
  	connection.schema_search_path = original_search_path #return to the original search path
  end

  #USING APARTMENT INSTRUCIONS: 
  # def create_schema
  # 	##create database using subdomain value. When it create the DB, all the migrations are executed
  # 	Apartment::Database.create(:subdomain)

  # 	#drop the tenant table from the subdomains
  # 	connection.execute("drop table #{self.class.table_name}")

  # end

end
