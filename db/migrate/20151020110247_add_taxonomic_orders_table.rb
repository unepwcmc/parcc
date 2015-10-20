class AddTaxonomicOrdersTable < ActiveRecord::Migration
  def change
    create_table "taxonomic_orders", force: true do |t|
      t.integer  "taxonomic_class_id"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
