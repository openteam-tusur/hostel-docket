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

ActiveRecord::Schema.define(:version => 20130911031813) do

  create_table "hostels", :force => true do |t|
    t.string   "address"
    t.string   "title"
    t.integer  "contingent_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "points", :force => true do |t|
    t.text     "description"
    t.string   "initiator"
    t.string   "note"
    t.string   "number"
    t.integer  "mark"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "records", :force => true do |t|
    t.text     "description"
    t.string   "initiator"
    t.string   "note"
    t.string   "number"
    t.integer  "mark"
    t.string   "hostel"
    t.string   "room"
    t.text     "memo"
    t.integer  "roomer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "records", ["roomer_id"], :name => "index_records_on_roomer_id"

  create_table "roomers", :force => true do |t|
    t.string   "surname"
    t.string   "name"
    t.string   "patronymic"
    t.integer  "room_id"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roomers", ["room_id"], :name => "index_roomers_on_room_id"

  create_table "rooms", :force => true do |t|
    t.string   "number"
    t.integer  "hostel_id"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rooms", ["hostel_id"], :name => "index_rooms_on_hostel_id"

end