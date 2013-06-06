class ChangeEmailIndex < ActiveRecord::Migration
  def change
  	remove_index :users, :email
  	#add_index :users, [:email, :subdomain_id], unique: true
  	add_index :users, :email, unique: true
  end
end
