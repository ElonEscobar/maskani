
ActiveRecord::Schema[7.0].define(version: 2023_02_16_091929) do
  create_table "auctions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.boolean "valid"
    t.datetime "end_date"
    t.integer "user_id"
    t.boolean "is_verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifieds", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "contact"
    t.string "location"
    t.string "occupation"
    t.string "description"
    t.integer "user_id"
    t.boolean "is_verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.string "category"
    t.integer "user_id"
    t.boolean "is_verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "description"
    t.string "amenities"
    t.boolean "onsale"
    t.integer "price"
    t.integer "user_id"
    t.boolean "is_verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "contact"
    t.string "location"
    t.string "category"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
