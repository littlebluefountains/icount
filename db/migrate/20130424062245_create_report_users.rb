class CreateReportUsers < ActiveRecord::Migration
  def change
    create_table :report_users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :receive_sms
      t.boolean :receive_mail

      t.timestamps
    end
  end

  # def change
  #   drop_table :sale_meter_readings

  #   create_table :sale_meter_readings do |t|
  #     t.float :opening_reading
  #     t.float :closing_reading
  #     t.float :liters_sold
  #     t.text :comments
  #     t.date :sales_date

  #     t.references :pump
  #     t.references :employee
  #     t.references :sales_period

  #     t.timestamps
  #   end
  #   add_index :sale_meter_readings, :pump_id
  #   add_index :sale_meter_readings, :employee_id
  #   add_index :sale_meter_readings, :sales_period_id
  # end
end
