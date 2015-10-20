class TaxonomicClassProtectedArea < ActiveRecord::Base

  belongs_to :taxonomic_class
  belongs_to :protected_area

end
