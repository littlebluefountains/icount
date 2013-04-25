Apartment.configure do |config|
	config.excluded_models = ["Tenant"]

	#dynamically get database names to migrate
	#config.database_names = lambda{ Tenant.pluck(:subdomain)}	#use subdomains to create databases

	#use a static list of database names to migrate
	config.database_names = ['granalturaoil', 'abeembolak', 'bambol']

	#disable appending environment name to database
	config.prepend_environment = !Rails.env.production?
end