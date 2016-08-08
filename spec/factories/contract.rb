FactoryGirl.define do
  factory :contract do
    description "Cool contract brochacho."
    sequence(:name) { |n| "Contract-#{n}" }
    sequence(:slug) { |n| "contract-#{n}" }
  end
end
