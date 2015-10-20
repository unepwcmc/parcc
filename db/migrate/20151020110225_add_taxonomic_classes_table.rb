class AddTaxonomicClassesTable < ActiveRecord::Migration
  def change
    create_table "taxonomic_classes", force: true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
