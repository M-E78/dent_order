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

ActiveRecord::Schema[7.2].define(version: 2026_04_19_095353) do
  create_table "clinics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "postal_code"
  end

  create_table "doctors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_doctors_on_clinic_id"
  end

  create_table "lab_orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "doctor_name"
    t.string "menu_name"
    t.string "material"
    t.string "shade"
    t.date "order_date"
    t.date "set_date"
    t.text "notes"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jaw_type"
    t.string "tooth_numbers"
    t.string "treatment_details"
    t.text "prosthesis_types"
    t.text "prep_items"
    t.string "pontic_form"
    t.bigint "user_id"
    t.string "metal_type"
    t.index ["patient_id"], name: "index_lab_orders_on_patient_id"
    t.index ["user_id"], name: "index_lab_orders_on_user_id"
  end

  create_table "labs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "postal_code"
    t.string "address"
    t.string "phone_number"
  end

  create_table "patients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.string "name"
    t.string "name_kana"
    t.string "chart_number"
    t.date "birth_date"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_patients_on_clinic_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "clinic_id"
    t.bigint "lab_id"
    t.string "name"
    t.string "otp_secret"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.integer "role", default: 0
    t.index ["clinic_id"], name: "index_users_on_clinic_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["lab_id"], name: "index_users_on_lab_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doctors", "clinics"
  add_foreign_key "lab_orders", "patients"
  add_foreign_key "lab_orders", "users"
  add_foreign_key "patients", "clinics"
  add_foreign_key "users", "clinics"
  add_foreign_key "users", "labs"
end
