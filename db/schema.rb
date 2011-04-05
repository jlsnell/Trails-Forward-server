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

ActiveRecord::Schema.define(:version => 20110405010822) do

  create_table "bids", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "bidder_id"
    t.integer  "current_owner_id"
    t.integer  "money"
    t.integer  "offered_land_id"
    t.integer  "requested_land_id"
    t.string   "status",            :default => "Offered"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rejection_reason"
    t.integer  "counter_to_id"
  end

  create_table "listings", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "megatile_grouping_id"
    t.integer  "price"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",               :default => "Active"
    t.integer  "bid_id"
  end

  create_table "megatile_grouping_megatiles", :force => true do |t|
    t.integer  "megatile_grouping_id"
    t.integer  "megatile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "megatile_groupings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "megatiles", :force => true do |t|
    t.integer  "world_id"
    t.integer  "x"
    t.integer  "y"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "world_id"
    t.integer  "balance"
    t.string   "type"
  end

  create_table "resource_tiles", :force => true do |t|
    t.integer  "megatile_id"
    t.integer  "x"
    t.integer  "y"
    t.string   "type"
    t.string   "zoned_use"
    t.integer  "quality"
    t.string   "species"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "world_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "modifications"
    t.integer  "number"
    t.integer  "reverted_from"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["tag"], :name => "index_versions_on_tag"
  add_index "versions", ["user_id", "user_type"], :name => "index_versions_on_user_id_and_user_type"
  add_index "versions", ["user_name"], :name => "index_versions_on_user_name"
  add_index "versions", ["versioned_id", "versioned_type"], :name => "index_versions_on_versioned_id_and_versioned_type"

  create_table "worlds", :force => true do |t|
    t.string   "name"
    t.integer  "year_start"
    t.integer  "year_current"
    t.integer  "height"
    t.integer  "width"
    t.integer  "megatile_width"
    t.integer  "megatile_height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
