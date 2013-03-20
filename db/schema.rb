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

ActiveRecord::Schema.define(:version => 20130320064749) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "designs", :force => true do |t|
    t.string   "name"
    t.integer  "vertical_tubes"
    t.integer  "horizontal_tubes"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "houses", :force => true do |t|
    t.integer  "product_id"
    t.string   "code"
    t.string   "email"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "state"
    t.string   "postcode"
    t.string   "uuid"
    t.boolean  "accepted_terms", :default => false, :null => false
  end

  add_index "houses", ["product_id"], :name => "index_houses_on_product_id"

  create_table "products", :force => true do |t|
    t.integer  "brand_id"
    t.integer  "design_id"
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "range_start"
    t.integer  "range_end"
  end

  add_index "products", ["brand_id"], :name => "index_products_on_brand_id"
  add_index "products", ["design_id"], :name => "index_products_on_design_id"

  create_table "tubes", :force => true do |t|
    t.integer  "house_id"
    t.string   "bee_code"
    t.string   "colour_code"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tubes", ["house_id"], :name => "index_tubes_on_house_id"

end
