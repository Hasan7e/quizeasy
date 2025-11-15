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

ActiveRecord::Schema[8.0].define(version: 2025_11_15_214258) do
  create_table "answers", force: :cascade do |t|
    t.integer "attempt_id", null: false
    t.integer "question_id", null: false
    t.integer "choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attempt_id"], name: "index_answers_on_attempt_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "attempts", force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.string "name"
    t.integer "score"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_attempts_on_quiz_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "body"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "attempts"
  add_foreign_key "answers", "questions"
  add_foreign_key "attempts", "quizzes"
  add_foreign_key "choices", "questions"
  add_foreign_key "questions", "quizzes"
end
