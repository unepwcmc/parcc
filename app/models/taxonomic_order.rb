class TaxonomicOrder < ActiveRecord::Base
  validates_uniqueness_of :name, scope: :taxonomic_class_id

  belongs_to :taxonomic_class
  has_many :species
end
