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

ActiveRecord::Schema.define(:version => 20110728220109) do

  create_table "subscription_options", :force => true do |t|
    t.integer  "months"
    t.integer  "price_in_cents", :default => 0, :null => false
    t.string   "currency"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_premia", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price_cents", :default => 0, :null => false
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
