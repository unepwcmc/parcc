class AddSpeciesProtectedAreasTable < ActiveRecord::Migration
  def change
    create_table "species_protected_areas", force: true do |t|
      t.integer  "species_id"
      t.integer  "protected_area_id"
      t.float    "intersection_area"
      t.float    "overlap_percentage"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "species_protected_areas", ["protected_area_id"], name: "index_species_protected_areas_on_protected_area_id", using: :btree
  end
end
