# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151003095127) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "answers", force: :cascade do |t|
    t.string  "title"
    t.integer "questionnaire_id"
  end

  add_index "answers", ["questionnaire_id"], name: "index_answers_on_questionnaire_id"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "department"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",             null: false
    t.string   "phone",            null: false
    t.string   "additional_phone", null: false
    t.string   "email",            null: false
    t.string   "organization",     null: false
    t.string   "position",         null: false
    t.string   "image_id"
    t.integer  "event_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "contacts", ["event_id"], name: "index_contacts_on_event_id"

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.string   "subtype"
    t.string   "attached_document_filename"
    t.string   "attached_document_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "attached_document_size"
    t.string   "attached_document_content_type"
  end

  create_table "event_documents", force: :cascade do |t|
    t.string   "title"
    t.integer  "event_id"
    t.string   "attached_document_id"
    t.string   "attached_document_filename"
    t.string   "attached_document_content_type"
    t.integer  "attached_document_size"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "section"
    t.text     "text"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.date     "start",       null: false
    t.date     "finish",      null: false
    t.string   "subtype",     null: false
    t.integer  "author_id"
    t.integer  "subject_id"
    t.boolean  "external",    null: false
    t.string   "aasm_state",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "excercise"
    t.text     "resolution"
    t.integer  "category_id"
  end

  add_index "events", ["author_id"], name: "index_events_on_author_id"
  add_index "events", ["subject_id"], name: "index_events_on_subject_id"

  create_table "faqs", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.string   "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "news", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "department"
  end

  create_table "news_images", force: :cascade do |t|
    t.integer  "news_id"
    t.string   "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires", force: :cascade do |t|
    t.text     "title"
    t.date     "starts_on"
    t.date     "ends_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "department"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           default: "", null: false
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "role"
    t.integer  "contacts_id"
    t.string   "department"
  end

  add_index "users", ["contacts_id"], name: "index_users_on_contacts_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
