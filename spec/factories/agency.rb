FactoryGirl.define do
  factory :agency do
    sequence(:code) { |n| "AG#{n}" }
    sequence(:name) { |n| "Agency-#{n}" }
  end
end
