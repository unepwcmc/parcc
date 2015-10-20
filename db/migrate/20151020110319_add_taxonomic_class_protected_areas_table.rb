class AddTaxonomicClassProtectedAreasTable < ActiveRecord::Migration
  def change
    create_table "taxonomic_class_protected_areas", force: true do |t|
      t.integer  "taxonomic_class_id"
      t.integer  "protected_area_id"
      t.integer  "count_total_species"
      t.integer  "count_vulnerable_species"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
