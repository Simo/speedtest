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

ActiveRecord::Schema.define(version: 20170614124536) do

  create_table "speed_tests", force: :cascade do |t|
    t.float "download"
    t.float "upload"
    t.integer "originalDownload"
    t.integer "originalUpload"
    t.string "ip"
    t.float "lat"
    t.float "lon"
    t.string "isp"
    t.float "isprating"
    t.float "rating"
    t.float "ispdlavg"
    t.float "ispulavg"
    t.string "host"
    t.float "hlat"
    t.float "hlon"
    t.string "location"
    t.string "country"
    t.string "cc"
    t.string "sponsor"
    t.float "distance"
    t.float "distanceMi"
    t.float "ping"
    t.string "idh"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
