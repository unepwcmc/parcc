# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :protected_area, class: ProtectedArea do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Name #{n}"}
    sequence(:wdpa_id) { |n| n }

    factory :protected_area_with_high_priority do
      high_priority true
    end

    after(:create) { |pa, evaluator|
      create_list(:species_turnover, 1, protected_area: pa)
    }
  end
end
