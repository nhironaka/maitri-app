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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160422020745) do

  create_table "patients", force: :cascade do |t|
    t.integer "one"
    t.string  "two"
    t.string  "three"
    t.string  "four"
    t.string  "five"
    t.string  "six"
    t.string  "seven"
    t.string  "eight"
    t.string  "nine"
    t.string  "ten"
    t.string  "eleven"
    t.string  "twelve"
    t.string  "thirteen"
    t.string  "fourteen"
    t.string  "fifteen"
    t.string  "sixteen"
    t.string  "seventeen"
    t.string  "eighteen"
    t.string  "nineteen"
    t.string  "twenty"
    t.string  "twenty_one"
    t.string  "twenty_two"
    t.string  "twenty_three"
    t.string  "twenty_four"
    t.string  "twenty_five"
    t.string  "twenty_six"
    t.string  "twenty_seven"
    t.string  "twenty_eight"
    t.string  "twenty_nine"
    t.string  "thirty"
    t.string  "thirty_one"
    t.string  "thirty_two"
    t.string  "thirty_three"
    t.string  "thirty_four"
    t.string  "thirty_five"
    t.string  "thirty_six"
    t.string  "thirty_seven"
    t.string  "thirty_eight"
    t.string  "thirty_nine"
    t.string  "forty"
    t.string  "forty_one"
    t.string  "forty_two"
    t.string  "forty_three"
    t.string  "forty_four"
    t.string  "forty_five"
    t.string  "forty_six"
    t.string  "forty_seven"
    t.string  "forty_eight"
    t.string  "forty_nine"
    t.string  "fifty"
    t.string  "fifty_one"
    t.string  "fifty_two"
    t.string  "fifty_three"
    t.string  "fifty_four"
    t.string  "fifty_five"
    t.string  "fifty_six"
    t.string  "fifty_seven"
    t.string  "fifty_eight"
    t.string  "fifty_nine"
    t.string  "sixty"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "username"
    t.boolean  "admin",                  default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
