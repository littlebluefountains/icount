class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :website
      t.string :subdomain

      t.timestamps
    end

    add_index :accounts, :subdomain
  end
end
