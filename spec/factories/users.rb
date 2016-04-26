FactoryGirl.define do
  factory :user do
    first_name "John"
    email "email@apps.com"
    last_name "Doe"
    password "12345sixSevenEight"

    trait :with_gov_email do
      email "email@apps.gov"
    end
  end
end
