# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130403190627) do

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "employee_no"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "product_prices", :force => true do |t|
    t.integer  "product_id"
    t.decimal  "old_price"
    t.decimal  "new_price"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "product_prices", ["product_id"], :name => "index_product_prices_on_product_id"
  add_index "product_prices", ["user_id"], :name => "index_product_prices_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.decimal  "unitprice"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pumps", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "manufacturer"
    t.string   "model"
    t.string   "serial_no"
    t.integer  "tank_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "pumps", ["tank_id"], :name => "index_pumps_on_tank_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sales_periods", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.integer  "zone_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stations", ["zone_id"], :name => "index_stations_on_zone_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "address"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tanks", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "capacity"
    t.integer  "product_id"
    t.integer  "station_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tanks", ["product_id"], :name => "index_tanks_on_product_id"
  add_index "tanks", ["station_id"], :name => "index_tanks_on_station_id"

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "zones", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end