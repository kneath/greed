# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 4) do

  create_table "advertisements", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "filename"
    t.string   "content_type"
    t.integer  "width"
    t.integer  "height"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.integer  "weight"
    t.integer  "impression_limit"
    t.datetime "starts_on"
    t.datetime "ends_on"
    t.integer  "spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spots", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.string   "pricing_type"
    t.string   "limit_type"
    t.integer  "campaign_limit"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
