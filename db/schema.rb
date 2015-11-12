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

ActiveRecord::Schema.define(version: 20151112152157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "comfy_cms_blocks", force: :cascade do |t|
    t.string   "identifier",     null: false
    t.text     "content"
    t.integer  "blockable_id"
    t.string   "blockable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_blocks", ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type", using: :btree
  add_index "comfy_cms_blocks", ["identifier"], name: "index_comfy_cms_blocks_on_identifier", using: :btree

  create_table "comfy_cms_categories", force: :cascade do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "comfy_cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true, using: :btree

  create_table "comfy_cms_categorizations", force: :cascade do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "comfy_cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true, using: :btree

  create_table "comfy_cms_files", force: :cascade do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_files", ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id", using: :btree
  add_index "comfy_cms_files", ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name", using: :btree
  add_index "comfy_cms_files", ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label", using: :btree
  add_index "comfy_cms_files", ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position", using: :btree

  create_table "comfy_cms_layouts", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.text     "css"
    t.text     "js"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_layouts", ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_layouts", ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true, using: :btree

  create_table "comfy_cms_pages", force: :cascade do |t|
    t.integer  "site_id",                        null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                          null: false
    t.string   "slug"
    t.string   "full_path",                      null: false
    t.text     "content_cache"
    t.integer  "position",       default: 0,     null: false
    t.integer  "children_count", default: 0,     null: false
    t.boolean  "is_published",   default: true,  null: false
    t.boolean  "is_shared",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_pages", ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_pages", ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path", using: :btree

  create_table "comfy_cms_revisions", force: :cascade do |t|
    t.string   "record_type", null: false
    t.integer  "record_id",   null: false
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "comfy_cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at", using: :btree

  create_table "comfy_cms_sites", force: :cascade do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "comfy_cms_sites", ["hostname"], name: "index_comfy_cms_sites_on_hostname", using: :btree
  add_index "comfy_cms_sites", ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored", using: :btree

  create_table "comfy_cms_snippets", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_snippets", ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true, using: :btree
  add_index "comfy_cms_snippets", ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position", using: :btree

  create_table "protected_areas", force: :cascade do |t|
    t.string   "name"
    t.string   "iso_3"
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
