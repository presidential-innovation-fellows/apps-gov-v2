FactoryGirl.define do
  factory :user do
    first_name "John"
    email "email@apps.com"
    last_name "Doe"
    password "12345sixSevenEight"

    trait :as_gov_user do
      type "GovernmentUser"
    end

    trait :as_product_owner do
      type "ProductOwner"
    end

    trait :verified do
      after(:build) do |user|
        user.confirm
      end
    end
  end
end
