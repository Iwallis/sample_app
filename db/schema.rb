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

ActiveRecord::Schema.define(version: 20180415214204) do

  create_table "flights", force: :cascade do |t|
    t.datetime "date"
    t.string "aircraft_type"
    t.string "aircraft_ident"
    t.string "pic"
    t.string "sic"
    t.decimal "day_hours", precision: 10, scale: 1
    t.decimal "night_hours", precision: 10, scale: 1
    t.boolean "is_single_engine", default: true
    t.boolean "is_xc", default: false
    t.boolean "is_dual", default: false
    t.decimal "hood_hours", precision: 10, scale: 1
    t.decimal "imc_hours", precision: 10, scale: 1
    t.decimal "sim_hours", precision: 10, scale: 1
    t.integer "ifr_apprs"
    t.string "route"
    t.text "comments"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "date"], name: "index_flights_on_user_id_and_date"
    t.index ["user_id"], name: "index_flights_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "license_number"
    t.string "location"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
