FactoryGirl.define do
  factory :species_turnover, class: SpeciesTurnover do
    association :protected_area, factory: :protected_area
    association :taxonomic_class, factory: :taxonomic_class

    year 2040
    median 0.500
    upper  0.750
    lower  0.250
  end
end


