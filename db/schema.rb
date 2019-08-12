# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_12_215738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "politicians", force: :cascade do |t|
    t.string "name"
    t.string "political_party"
    t.integer "age"
    t.string "kind"
    t.string "state"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "score", default: 1000
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "politicians_id", null: false
    t.decimal "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["politicians_id"], name: "index_votes_on_politicians_id"
  end

  add_foreign_key "votes", "politicians", column: "politicians_id"
end
