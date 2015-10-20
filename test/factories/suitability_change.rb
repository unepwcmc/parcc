FactoryGirl.define do
  factory :suitability_change, class: SuitabilityChange do
    association :protected_area, factory: :protected_area
    association :species, factory: :species

    year 2040
    value 'Inc'
  end
end



