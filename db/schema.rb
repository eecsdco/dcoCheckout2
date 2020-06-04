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

ActiveRecord::Schema.define(version: 20180411155625) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "description",         null: false
    t.integer  "loan_length_seconds", null: false
  end

  create_table "notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                     null: false
    t.text     "text",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "offices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                     null: false
    t.text     "address",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "title_id",                      null: false
    t.string   "borrower",                      null: false
    t.text     "note",            limit: 65535
    t.string   "agent",                         null: false
    t.datetime "out",                           null: false
    t.datetime "in"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "due"
    t.datetime "return_approved"
    t.string   "option"
    t.integer  "office_id"
    t.index ["office_id"], name: "index_records_on_office_id", using: :btree
    t.index ["title_id"], name: "index_records_on_title_id", using: :btree
  end

  create_table "titles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id",                       null: false
    t.string   "name",                              null: false
    t.text     "description",         limit: 65535, null: false
    t.integer  "n_available"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "loan_length_seconds"
    t.integer  "notice_id"
    t.integer  "office_id"
    t.boolean  "enabled",                           null: false
    t.text     "options_str",         limit: 65535
    t.index ["category_id"], name: "index_titles_on_category_id", using: :btree
    t.index ["notice_id"], name: "index_titles_on_notice_id", using: :btree
    t.index ["office_id"], name: "index_titles_on_office_id", using: :btree
  end

  add_foreign_key "records", "offices"
end
