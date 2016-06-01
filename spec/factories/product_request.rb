FactoryGirl.define do
  factory :product_request do
    product
    user

    trait :with_draft do
      after(:create) do |product_request|
        product_request.draft_creation
      end
    end
  end
end
