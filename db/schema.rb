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

ActiveRecord::Schema[7.0].define(version: 2023_04_25_153742) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tasks", primary_key: "task_no", id: { comment: "タスクNo" }, force: :cascade do |t|
    t.integer "user_id", null: false, comment: "ユーザーID"
    t.string "title", limit: 256, comment: "タスク名"
    t.text "discriptions", comment: "説明"
    t.datetime "created_at", comment: "登録日時"
    t.datetime "modified_at", comment: "更新日時"
  end

  create_table "users", primary_key: "user_id", id: { type: :serial, comment: "ユーザーID" }, force: :cascade do |t|
    t.string "name", limit: 128, null: false, comment: "名前"
    t.string "password", limit: 32, null: false, comment: "パスワード"
    t.boolean "is_admin", default: false, comment: "管理者フラグ"
    t.boolean "is_delete", default: false, comment: "削除フラグ"
    t.datetime "created_at", comment: "登録日時"
    t.datetime "modified_at", comment: "更新日時"
  end

end
