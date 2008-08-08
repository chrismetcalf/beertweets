# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080605145249) do

  create_table "authors", :force => true do |t|
    t.integer  "twitter_id"
    t.string   "screen_name"
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.string   "location"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.integer  "twitter_id", :null => false
    t.datetime "created_at"
    t.string   "text",       :null => false
    t.string   "source"
    t.integer  "rating"
    t.integer  "author_id",  :null => false
    t.datetime "updated_at"
  end

end
