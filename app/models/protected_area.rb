class ProtectedArea < ActiveRecord::Base
  COLUMNS_FOR_API = [
    :name, :iso_3,
    :designation, :geom_type,
    :iucn_cat,    :wdpa_id,
    :count_total_species,
    :count_vulnerable_species,
    :percentage_vulnerable_species
  ]

  has_many :species_protected_areas, foreign_key: :protected_area_id
  has_many :species, through: :species_protected_areas

  has_many :species_turnovers
  has_many :suitability_changes

  has_many :taxonomic_class_protected_areas
  has_many :taxonomic_classes, through: :taxonomic_class_protected_areas

  scope :with_turnovers, -> { includes(species_turnovers: :taxonomic_class) }

  def self.for_api
    select(COLUMNS_FOR_API).to_json only: COLUMNS_FOR_API
  end

  def for_api with_species: with_species
    to_json({only: COLUMNS_FOR_API}.tap{ |opts|
      opts[:include] = :species_protected_areas if with_species
    })
  end
end
