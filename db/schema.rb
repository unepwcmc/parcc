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

ActiveRecord::Schema.define(version: 20151020110319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "protected_areas", force: :cascade do |t|
    t.integer  "parcc_id"
    t.string   "name"
    t.string   "iso_3"
    t.integer  "poly_id"
    t.string   "designation"
    t.string   "geom_type"
    t.string   "iucn_cat"
    t.integer  "wdpa_id"
    t.integer  "percentage_vulnerable_species"
    t.boolean  "high_priority",                 default: false
    t.integer  "count_total_species",           default: 0
    t.integer  "count_vulnerable_species",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "protected_areas", ["wdpa_id"], name: "index_protected_areas_on_wdpa_id", using: :btree

  create_table "species", force: :cascade do |t|
    t.integer  "taxonomic_order_id"
    t.string   "name"
    t.string   "iucn_cat"
    t.string   "sensitivity"
    t.string   "adaptability"
    t.string   "exposure_2025"
    t.string   "exposure_2055"
    t.boolean  "cc_vulnerable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species_protected_areas", force: :cascade do |t|
    t.integer  "species_id"
    t.integer  "protected_area_id"
    t.float    "intersection_area"
    t.float    "overlap_percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "species_protected_areas", ["protected_area_id"], name: "index_species_protected_areas_on_protected_area_id", using: :btree

  create_table "species_turnovers", force: :cascade do |t|
    t.integer  "protected_area_id"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "taxonomic_class_id"
    t.float    "lower"
    t.float    "median"
    t.float    "upper"
  end

  add_index "species_turnovers", ["protected_area_id"], name: "index_species_turnovers_on_protected_area_id", using: :btree

  create_table "suitability_changes", force: :cascade do |t|
    t.integer  "species_id"
    t.integer  "protected_area_id"
    t.integer  "year"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suitability_changes", ["protected_area_id"], name: "index_suitability_changes_on_protected_area_id", using: :btree
  add_index "suitability_changes", ["species_id"], name: "index_suitability_changes_on_species_id", using: :btree
  add_index "suitability_changes", ["value"], name: "index_suitability_changes_on_value", where: "(((value)::text = 'Dec'::text) OR ((value)::text = 'Inc'::text))", using: :btree

  create_table "taxonomic_class_protected_areas", force: :cascade do |t|
    t.integer  "taxonomic_class_id"
    t.integer  "protected_area_id"
    t.integer  "count_total_species"
    t.integer  "count_vulnerable_species"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxonomic_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxonomic_orders", force: :cascade do |t|
    t.integer  "taxonomic_class_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
