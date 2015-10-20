class SpeciesProtectedArea < ActiveRecord::Base
  belongs_to :species
  belongs_to :protected_area

  scope :by_taxonomic_class, -> taxonomic_class {
    joins(species: {taxonomic_order: :taxonomic_class}).where("taxonomic_classes.name = ?", taxonomic_class)
  }

  def self.vulnerability_table_for protected_area_id, taxonomic_class=nil
    scoped = where(protected_area_id: protected_area_id)
    scoped = scoped.by_taxonomic_class(taxonomic_class) if taxonomic_class.present?
    scoped
  end
end
