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

ActiveRecord::Schema.define(version: 2020_05_12_142606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_topics", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_topics_on_article_id"
    t.index ["topic_id"], name: "index_article_topics_on_topic_id"
  end

  create_table "articles", force: :cascade do |t|
    t.integer "number"
    t.string "chapter"
    t.string "section"
    t.text "details"
    t.bigint "governance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["governance_id"], name: "index_articles_on_governance_id"
  end

  create_table "governances", force: :cascade do |t|
    t.string "title"
    t.date "issued"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "article_topics", "articles"
  add_foreign_key "article_topics", "topics"
  add_foreign_key "articles", "governances"
end
