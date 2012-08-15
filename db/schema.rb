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

ActiveRecord::Schema.define(:version => 20120815012553) do

  create_table "ads", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "owner",        :limit => 1
    t.integer  "deal",         :limit => 1
    t.integer  "real_estate",  :limit => 1
    t.integer  "purpose",      :limit => 1
    t.float    "area"
    t.integer  "floor",        :limit => 1
    t.integer  "rooms_number", :limit => 1
    t.boolean  "water"
    t.boolean  "light"
    t.boolean  "bathroom"
    t.boolean  "heating"
    t.string   "image"
    t.integer  "region",       :limit => 1
    t.integer  "city",         :limit => 1
    t.integer  "user_id"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.decimal  "price",                     :precision => 8, :scale => 2
  end

  add_index "ads", ["user_id"], :name => "index_ads_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "phone"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
