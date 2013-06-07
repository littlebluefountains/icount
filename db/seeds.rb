# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create 3 tenants if not at subdomain schema but on public schema
#Tenant.create([{subdomain: 'granalturaloil'}, {subdomain: 'abeembolak'}, {subdomain: 'bambol'}]) #if table_exists? :tenants

#rewrite; the roles are created for each schema
#Role.create([{name: 'Admin'}, {name: 'Manager'}, {name: 'SalesPerson'}])
#user = User.create!(username: 'gal_admin', password: '12345678', email: 'gal.admin@gal.com', super_admin: 'true')

#delete all the accounts
#Account.delete_all
#User.delete_all

#create an Account for GAL
#account = Account.create!(name: 'GAL', subdomain: 'gal', website: 'www.granalturaltd.com', email: 'admin@gran-alturalimited.com')
#create user
#user = User.new(username: 'gal_admin', password: '12345678', email: 'gal.admin@gal.com', super_admin: 'true')

# account = Account.create!(name: 'Example', subdomain: 'example', website: 'www.example.com', email: 'admin@example.com')
# account.create_schema

# #create user
# user = User.new(username: 'example_admin', password: '12345678', email: 'example.admin@example.com', super_admin: 'true')
# user.roles = [:super_admin]
# user.save!

# account.owner = user
# account.users << user

# user.account = account

# account.save

#get a connection
conn = ActiveRecord::Base.connection

["admin", "fatgbem", "abeembolak", "bambol", "granalturaoil"].each do	|s|
	conn.execute "DROP SCHEMA IF EXISTS #{s}"

	account = Account.create!(name: "#{s.upcase}", subdomain: "#{s}", website: "'www.#{s}.com'", email: "admin@#{s}.com")
	account.create_schema

	#create user
	#if s == "gal"
	if s == "admin"
		#user = User.new(username: "#{s}_admin", password: '12345678', email: "admin@#{s}.com", super_admin: 'true')
		user = User.new(username: "gal_admin", password: '12345678', email: "admin@#gran-alturalimited.com", super_admin: 'true')
		user.roles = [:super_admin]
		#init_account(account, user)
		user.save!

		account.owner = user
		account.users << user

		user.account = account

	else
		user = User.new(username: "#{s}_admin", password: '12345678', email: "admin@#{s}.com", super_admin: 'false')
		user.roles = [:admin]
		#init_account(account, user)
		user.save!

		account.owner = user
		account.users << user

		user.account = account

		#account.save
	end

	account.save
end

# def init_account(account, user)
# 	user.save!

# 	account.owner = user
# 	account.users << user

# 	user.account = account

# 	account.save
# end



#assign Admin role to user
#user.roles << Role.find_by_name('Admin')


