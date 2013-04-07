class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :contact
      t.string :address
      t.string :phone
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end
end
