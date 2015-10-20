class Species < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :species_protected_areas
  has_many :protected_areas, through: :species_protected_areas
  has_many :suitability_changes

  belongs_to :taxonomic_order
  delegate :taxonomic_class, to: :taxonomic_order
end
