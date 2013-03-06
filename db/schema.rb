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

ActiveRecord::Schema.define(:version => 20130306073945) do

  create_table "discount_cash_flows", :force => true do |t|
    t.integer  "year"
    t.float    "prev_cash_flow"
    t.float    "growth_rate"
    t.float    "cash_flow"
    t.float    "discount_factor"
    t.float    "total"
    t.integer  "stock_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "discount_cash_flows", ["stock_id"], :name => "index_discount_cash_flows_on_stock_id"

  create_table "earnings", :force => true do |t|
    t.integer  "year"
    t.float    "pe"
    t.float    "div"
    t.float    "sheq"
    t.float    "earnings"
    t.integer  "stock_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "earnings", ["stock_id"], :name => "index_earnings_on_stock_id"

  create_table "portfolios", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projected_earnings", :force => true do |t|
    t.float    "earnings"
    t.float    "ave_pe"
    t.integer  "year"
    t.integer  "stock_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "projected_earnings", ["stock_id"], :name => "index_projected_earnings_on_stock_id"

  create_table "stocks", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.float    "price"
    t.float    "pe"
    t.float    "div"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.float    "guess_growth"
    t.float    "ten_year_growth"
    t.decimal  "buy_at"
    t.decimal  "dollar_difference"
    t.decimal  "difference"
    t.decimal  "market_value"
    t.string   "buy_decision"
  end

end
