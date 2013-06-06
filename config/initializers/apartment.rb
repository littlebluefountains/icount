Apartment.configure do |config|
	#configure Apartment to use a subdomain
    #config.middleware.use 'Apartment::Elevators::Subdomain'

	config.excluded_models = ["Tenant", "Account", "AccountsUser", "User", "Role"]#, "Ability"]

	# #dynamically get database names to migrate
	config.database_names = lambda{ Account.pluck(:subdomain)}	#use subdomains to create databases

	# #use a static list of database names to migrate
	config.database_names = ['fatgbem', 'abeembolak']

	# #disable appending environment name to database
	# config.prepend_environment = !Rails.env.production?
end