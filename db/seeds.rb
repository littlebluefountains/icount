# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create 3 tenants if not at subdomain schema but on public schema
Tenant.create([{subdomain: 'granalturaloil'}, {subdomain: 'abeembolak'}, {subdomain: 'bambol'}]) #if table_exists? :tenants

#rewrite; the roles are created for each schema
Role.create([{name: 'Admin'}, {name: 'Manager'}, {name: 'SalesPerson'}])

#create user
user = User.create!(username: 'gal_admin', password: '12345678', email: 'gal.admin@gal.com')

#assign Admin role to user
user.roles << Role.find_by_name('Admin')