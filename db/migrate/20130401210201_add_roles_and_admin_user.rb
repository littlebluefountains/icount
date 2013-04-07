class AddRolesAndAdminUser < ActiveRecord::Migration
  def up
  	#create roles
  	Role.create([{name: 'Admin'}, {name: 'Manager'}, {name: 'SalesPerson'}])


  	#create user
  	user = User.create!(username: 'gal_admin', password: '12345678', email: 'gal.admin@gal.com')

  	#assign Admin role to user
  	user.roles << Role.find_by_name('Admin')

  end

  def down
  	user = User.find_by_username('gal_admin')
  	user.destroy
  end
end
