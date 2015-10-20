# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :taxonomic_class, class: TaxonomicClass do
    sequence(:name) { |n| "Class n.#{n}" }
  end
end


