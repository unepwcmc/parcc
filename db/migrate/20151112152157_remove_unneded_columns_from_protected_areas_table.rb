class RemoveUnnededColumnsFromProtectedAreasTable < ActiveRecord::Migration
  def change
    remove_column :protected_areas, :parcc_id
    remove_column :protected_areas, :poly_id
  end
end
