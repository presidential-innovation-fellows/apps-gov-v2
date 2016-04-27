FactoryGirl.define do
  factory :user do
    first_name "John"
    email "email@apps.com"
    last_name "Doe"
    password "12345sixSevenEight"

    trait :as_gov_user do
      type "GovernmentUser"
    end
  end
end
