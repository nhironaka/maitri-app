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
    t.string "1"
    t.string "2"
    t.string "3"
    t.string "4"
    t.string "5"
    t.string "6"
    t.string "7"
    t.string "8"
    t.string "9"
    t.string "10"
    t.string "11"
    t.string "12"
    t.string "13"
    t.string "14"
    t.string "15"
    t.string "16"
    t.string "17"
    t.string "18"
    t.string "19"
    t.string "20"
    t.string "21"
    t.string "22"
    t.string "23"
    t.string "24"
    t.string "25"
    t.string "26"
    t.string "27"
    t.string "28"
    t.string "29"
    t.string "30"
    t.string "31"
    t.string "32"
    t.string "33"
    t.string "34"
    t.string "35"
    t.string "36"
    t.string "37"
    t.string "38"
    t.string "39"
    t.string "40"
    t.string "41"
    t.string "42"
    t.string "43"
    t.string "44"
    t.string "45"
    t.string "46"
    t.string "47"
    t.string "48"
    t.string "49"
    t.string "50"
    t.string "51"
    t.string "52"
    t.string "53"
    t.string "54"
    t.string "55"
    t.string "56"
    t.string "one"
    t.string "two"
    t.string "three"
    t.string "four"
    t.string "five"
    t.string "six"
    t.string "seven"
    t.string "eight"
    t.string "nine"
    t.string "ten"
    t.string "eleven"
    t.string "twelve"
    t.string "thirteen"
    t.string "fourteen"
    t.string "fifteen"
    t.string "sixteen"
    t.string "seventeen"
    t.string "eighteen"
    t.string "nineteen"
    t.string "twenty"
    t.string "twenty one"
    t.string "twenty two"
    t.string "twenty three"
    t.string "twenty four"
    t.string "twenty five"
    t.string "twenty six"
    t.string "twenty seven"
    t.string "twenty eight"
    t.string "twenty nine"
    t.string "thirty"
    t.string "thirty one"
    t.string "thirty two"
    t.string "thirty three"
    t.string "thirty four"
    t.string "thirty five"
    t.string "thirty six"
    t.string "thirty seven"
    t.string "thirty eight"
    t.string "thirty nine"
    t.string "forty"
    t.string "forty one"
    t.string "forty two"
    t.string "forty three"
    t.string "forty four"
    t.string "forty five"
    t.string "forty six"
    t.string "forty seven"
    t.string "forty eight"
    t.string "forty nine"
    t.string "fifty"
    t.string "fifty one"
    t.string "fifty two"
    t.string "fifty three"
    t.string "fifty four"
    t.string "fifty five"
    t.string "fifty six"
    t.string "fifty seven"
    t.string "fifty eight"
    t.string "fifty nine"
    t.string "sixty"
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
