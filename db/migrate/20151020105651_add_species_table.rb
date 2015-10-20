class AddSpeciesTable < ActiveRecord::Migration
  def change
    create_table "species", force: true do |t|
      t.integer  "taxonomic_order_id"
      t.string   "name"
      t.string   "iucn_cat"
      t.string   "sensitivity"
      t.string   "adaptability"
      t.string   "exposure_2025"
      t.string   "exposure_2055"
      t.boolean  "cc_vulnerable"

      t.timestamps
    end
  end
end
