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

ActiveRecord::Schema.define(version: 2020_04_16_131844) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "book_marks", force: :cascade do |t|
    t.integer "tourist_id"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "tourist_id"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_comments_on_tour_id"
    t.index ["tourist_id"], name: "index_comments_on_tourist_id"
  end

  create_table "commments", force: :cascade do |t|
    t.string "content"
    t.integer "tourist_id"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_commments_on_tour_id"
    t.index ["tourist_id"], name: "index_commments_on_tourist_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guides", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "is_active", default: true
    t.string "family_name", null: false
    t.string "name", null: false
    t.string "nationality", null: false
    t.string "identification_image_id", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "selfy_image_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_guides_on_deleted_at"
    t.index ["email"], name: "index_guides_on_email", unique: true
    t.index ["reset_password_token"], name: "index_guides_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.integer "room_id"
    t.boolean "is_tourist"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "tour_id"
    t.integer "comment_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tourist_id"
    t.integer "guide_id"
    t.index ["comment_id"], name: "index_notifications_on_comment_id"
    t.index ["tour_id"], name: "index_notifications_on_tour_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "tourist_id", null: false
    t.integer "tour_id", null: false
    t.integer "guide_id", null: false
    t.string "tour_title", null: false
    t.text "tour_body", null: false
    t.integer "price", null: false
    t.string "contents_of_price", null: false
    t.integer "capacity", null: false
    t.integer "total_people", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "companion"
    t.string "tour_time"
    t.string "tour_city"
    t.integer "status", default: 0
    t.integer "admin_sales"
    t.integer "guide_sales"
    t.string "tour_genre"
    t.integer "tour_price"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "tourist_id"
    t.integer "guide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guide_id"], name: "index_rooms_on_guide_id"
    t.index ["tourist_id"], name: "index_rooms_on_tourist_id"
  end

  create_table "tour_photos", force: :cascade do |t|
    t.string "image_id"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tourists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
    t.string "family_name", null: false
    t.string "name", null: false
    t.string "sex", null: false
    t.integer "birth_year", null: false
    t.string "nationality", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_tourists_on_deleted_at"
    t.index ["email"], name: "index_tourists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tourists_on_reset_password_token", unique: true
  end

  create_table "tours", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "guide_id", null: false
    t.integer "city_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.integer "capacity", null: false
    t.integer "price", null: false
    t.string "contents_of_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
    t.string "time"
    t.string "meetingpoint_address"
    t.string "meetingpoint_introduction"
    t.float "latitude"
    t.float "longitude"
  end

end
