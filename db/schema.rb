# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_03_153454) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "date", null: false
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_bookings_on_request_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "message", default: ""
    t.datetime "received"
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "date", null: false
    t.bigint "user_id"
    t.bigint "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_requests_on_space_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", default: ""
    t.integer "price", null: false
    t.datetime "date_from", null: false
    t.datetime "date_to", null: false
    t.bigint "user_id"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_spaces_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "requests", on_delete: :cascade
  add_foreign_key "requests", "spaces", on_delete: :cascade
  add_foreign_key "requests", "users", on_delete: :cascade
  add_foreign_key "spaces", "users", on_delete: :cascade
end
