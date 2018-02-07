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

ActiveRecord::Schema.define(version: 20180207214637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id", null: false
    t.integer "recipient_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.date "birthdate", null: false
    t.string "gender", null: false
    t.float "latitude"
    t.float "longitude"
    t.text "about_me"
    t.text "looking_for"
    t.string "primary_img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", unique: true
  end

  create_table "question_answers", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.integer "question_option_id", null: false
    t.integer "importance", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_answers_on_question_id"
    t.index ["question_option_id"], name: "index_question_answers_on_question_option_id"
    t.index ["user_id"], name: "index_question_answers_on_user_id"
  end

  create_table "question_friend_answers", force: :cascade do |t|
    t.integer "question_answer_id"
    t.integer "question_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_answer_id"], name: "index_question_friend_answers_on_question_answer_id"
    t.index ["question_option_id"], name: "index_question_friend_answers_on_question_option_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.integer "question_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_queries", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "min_age"
    t.integer "max_age"
    t.integer "max_distance"
    t.integer "active_within"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_search_queries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "demo"
    t.integer "activity_count"
    t.index ["demo"], name: "index_users_on_demo"
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
