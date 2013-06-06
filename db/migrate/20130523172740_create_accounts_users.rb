class CreateAccountsUsers < ActiveRecord::Migration
  def change
    create_table :accounts_users do |t|
      t.references :account
      t.references :user

      t.timestamps
    end
    add_index :accounts_users, :account_id
    add_index :accounts_users, :user_id
  end
end
