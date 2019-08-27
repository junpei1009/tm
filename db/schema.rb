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

ActiveRecord::Schema.define(version: 2019_08_27_055659) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.integer "product_id"
    t.string "artist_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.string "tell"
    t.string "birthday"
    t.integer "customer_postal_code"
    t.string "customer_prefecture"
    t.string "customer_city"
    t.string "customer_street_address"
    t.string "customer_building_name", default: ""
    t.datetime "delete_at"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index [nil], name: "index_customers_on_deleted_at"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "postal_code"
    t.string "prefecture"
    t.string "city"
    t.string "street_address"
    t.string "building_name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disks", force: :cascade do |t|
    t.integer "product_id"
    t.string "disk_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.integer "product_id"
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jakets", force: :cascade do |t|
    t.integer "product_id"
    t.string "jaket_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.integer "product_id"
    t.string "label_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_histories", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "number"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.string "payment"
    t.string "shipping_address"
    t.string "delivery_status"
    t.integer "subtotal_amount"
    t.integer "total_amount"
    t.integer "postage"
    t.integer "consumption_tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_aritists", force: :cascade do |t|
    t.integer "product_id"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_genres", force: :cascade do |t|
    t.integer "product_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "format"
    t.string "title"
    t.integer "stock"
    t.string "status"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sings", force: :cascade do |t|
    t.integer "disk_id"
    t.string "sing_name"
    t.integer "sing_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
