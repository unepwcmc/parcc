class SuitabilityChange < ActiveRecord::Base
  belongs_to :species
  belongs_to :protected_area

  scope :with_changes, -> { where(value: ['Inc', 'Dec']) }
  scope :with_taxonomic_class, -> taxonomic_class {
    joins(species: {taxonomic_order: :taxonomic_class}).
      where("taxonomic_classes.name = ?", taxonomic_class)
  }
end
