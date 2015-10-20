class AddSuitabilityChangesTable < ActiveRecord::Migration
  def change
    create_table "suitability_changes", force: true do |t|
      t.integer  "species_id"
      t.integer  "protected_area_id"
      t.integer  "year"
      t.string   "value"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index(:suitability_changes, :value, where: "value = 'Dec' OR value = 'Inc'")
    add_index(:suitability_changes, :species_id)
    add_index(:suitability_changes, :protected_area_id)
  end
end
