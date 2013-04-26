# db_tasks = %w[db:migrate db:migrate:up db:migrate:down db:rollback db:forward]

# namespace :multitenant do
#   db_tasks.each do |task_name|
#     desc "Run #{task_name} for each tenant"
#     task task_name => %w[environment db:load_config] do
#       ## ADDED BY ME ##
#       ## CREATE DEFAULT TENANTS ##
#       #Tenant.create!([{subdomain: 'granalturaloil'}, {subdomain: 'abeembolak'}, {subdomain: 'bambol'}]) #if table_exists? :tenants

#       ## END ##

#       Tenant.find_each do |tenant|
#         puts "Running #{task_name} for tenant#{tenant.id} (#{tenant.subdomain})"
#         tenant.scope_schema { Rake::Task[task_name].execute }

#         ## ADDED BY ME ##
#         ## CREATE DEFAULT ROLES AND USERS ##
# 		#Role.create!([{name: 'Admin'}, {name: 'Manager'}, {name: 'SalesPerson'}])

# 		#user = User.create!(username: 'gal_admin', password: '12345678', email: 'gal.admin@gal.com')
# 		## END ##

#       end
#     end
#   end
# end

# db_tasks.each do |task_name|
#   Rake::Task[task_name].enhance(["multitenant:#{task_name}"])
# end