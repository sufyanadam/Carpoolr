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

ActiveRecord::Schema.define(version: 2012_01_17_024142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destination_spots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.integer "pickup_spot_id"
    t.integer "number_of_seats", default: 0, null: false
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "last_seen_at"
    t.integer "destination_spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickup_spots", force: :cascade do |t|
    t.string "name"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riders", force: :cascade do |t|
    t.integer "pickup_spot_id"
    t.datetime "last_seen_at"
    t.integer "destination_spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
