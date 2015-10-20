class TaxonomicClass < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :taxonomic_orders

  has_many :taxonomic_class_protected_areas
  has_many :protected_areas, through: :taxonomic_class_protected_areas
end
