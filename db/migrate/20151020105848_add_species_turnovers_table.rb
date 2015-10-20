class AddSpeciesTurnoversTable < ActiveRecord::Migration
  def change
    create_table "species_turnovers", force: true do |t|
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
  end
end
