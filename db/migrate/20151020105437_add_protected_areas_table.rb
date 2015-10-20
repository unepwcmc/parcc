class AddProtectedAreasTable < ActiveRecord::Migration
  def change
    create_table "protected_areas", force: true do |t|
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

      t.timestamps
    end

    add_index "protected_areas", ["wdpa_id"], name: "index_protected_areas_on_wdpa_id", using: :btree
  end
end
