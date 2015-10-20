# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :species_protected_area, class: SpeciesProtectedArea do
    association :protected_area, factory: :protected_area
    association :species, factory: :species
  end
end


