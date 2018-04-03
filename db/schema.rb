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

ActiveRecord::Schema.define(version: 20180403092230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teachers_id"
    t.boolean "is_active", default: false
    t.index ["teachers_id"], name: "index_channels_on_teachers_id"
  end

  create_table "errors", force: :cascade do |t|
    t.string "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "message_id"
    t.index ["message_id"], name: "index_errors_on_message_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.bigint "message_id"
    t.index ["message_id"], name: "index_favorites_on_message_id"
    t.index ["teacher_id"], name: "index_favorites_on_teacher_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "percent", default: true
  end

  create_table "students", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "channels_id"
    t.index ["channels_id"], name: "index_students_on_channels_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_teachers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_teachers_on_uid_and_provider", unique: true
  end

  add_foreign_key "channels", "teachers", column: "teachers_id"
  add_foreign_key "errors", "messages"
  add_foreign_key "favorites", "messages"
  add_foreign_key "favorites", "teachers"
  add_foreign_key "students", "channels", column: "channels_id"
end
