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

ActiveRecord::Schema.define(version: 2022_07_19_143412) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "travel_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_comments_on_customer_id"
    t.index ["travel_id"], name: "index_comments_on_travel_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "account", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "self_introduction", default: "", null: false
    t.boolean "is_active", default: true, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "follows", force: :cascade do |t|
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_follows_on_customer_id"
  end

  create_table "goods", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "travel_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_goods_on_customer_id"
    t.index ["travel_id"], name: "index_goods_on_travel_id"
  end

  create_table "travel_details", force: :cascade do |t|
    t.date "travel_date", null: false
    t.string "travel_title_detail", default: "", null: false
    t.time "start_time", null: false
    t.time "finish_time", null: false
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "travels", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "travel_detail_id"
    t.date "travel_start", null: false
    t.date "travel_finish", null: false
    t.string "travel_title", default: "", null: false
    t.string "destination", default: "", null: false
    t.boolean "open", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_travels_on_customer_id"
    t.index ["travel_detail_id"], name: "index_travels_on_travel_detail_id"
  end

  add_foreign_key "comments", "customers"
  add_foreign_key "comments", "travels"
  add_foreign_key "follows", "customers"
  add_foreign_key "goods", "customers"
  add_foreign_key "goods", "travels"
  add_foreign_key "travels", "customers"
  add_foreign_key "travels", "travel_details"
end
