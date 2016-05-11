FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product-#{n}" }
    long_description "Lorem ipsum Aliqua pariatur dolor pariatur fugiat."
    short_description "Lorem ipsum Sed non est ut sed nisi fugiat eu qui dolor."
    url "https://pif.gov/pizza-tracker"
    logo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'sample-logo.png'), 'image/png') }

    trait :with_category do
      after(:create) do |product|
        category = create(:category)
        create(:product_category, category: category, product: product)
      end
    end

    trait :with_gov_user do
      after(:create) do |product|
        user = create(:user, :as_gov_user)
        create(:product_request, product: product, user: user)
      end
    end

    trait :with_product_owner do
      after(:create) do |product|
        user = create(:user, :as_product_owner)
        create(:product_request, product: product, user: user)
      end
    end

    trait :with_product_request do
      after(:create) do |product|
        create(:product_request, product: product)
      end
    end
  end
end
