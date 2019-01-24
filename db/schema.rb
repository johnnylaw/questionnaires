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

ActiveRecord::Schema.define(version: 20190124233611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "option_sets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.bigint "option_set_id"
    t.decimal "numerical"
    t.string "name"
    t.index ["option_set_id"], name: "index_options_on_option_set_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "permalink"
    t.index ["permalink"], name: "index_questionnaires_on_permalink", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.integer "number"
    t.bigint "option_set_id"
    t.string "body"
    t.index ["option_set_id"], name: "index_questions_on_option_set_id"
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "user_uuid"
    t.bigint "question_id"
    t.decimal "value"
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  add_foreign_key "options", "option_sets"
  add_foreign_key "questions", "option_sets"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "responses", "questions"
end
