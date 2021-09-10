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

ActiveRecord::Schema.define(version: 2021_04_24_020159) do

  create_table "clients", force: :cascade do |t|
    t.string "client_name"
    t.boolean "status"
    t.integer "total_requests"
    t.string "company"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "fax"
    t.string "notes"
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "downloads", force: :cascade do |t|
    t.string "title"
    t.string "file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
  end

  create_table "firms", force: :cascade do |t|
    t.string "invoice_data"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "maiden_name"
    t.string "dob"
    t.string "ssn"
    t.string "dl_state"
    t.string "dl_number"
    t.string "notes"
    t.string "client_request"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file"
    t.integer "client_id"
    t.decimal "total"
    t.boolean "paid", default: false
  end

  create_table "firms_services", id: false, force: :cascade do |t|
    t.integer "firm_id", null: false
    t.integer "service_id", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "service_type"
    t.string "description"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
