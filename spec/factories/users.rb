FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    password "12345sixSevenEight"
    sequence(:email) { |n| "email#{n}@apps.com" }

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
