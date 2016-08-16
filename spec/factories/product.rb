FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product-#{n}" }
    long_description "Lorem ipsum Aliqua pariatur dolor pariatur fugiat."
    short_description "Lorem ipsum Sed non est ut sed nisi fugiat eu qui dolor."
    url "https://pif.gov/pizza-tracker"
    logo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'sample-logo.png'), 'image/png') }

    trait :published do
      after(:build) do |product|
        product.published_at = Time.now
      end
    end

    trait :with_ato_type do
      after(:create) do |product|
        ato_type = create(:ato_type)
        create(:ato_status, ato_type: ato_type, product: product)
      end
    end

    trait :with_subcategory do
      after(:create) do |product|
        subcategory = create(:subcategory)
        create(:product_subcategory, subcategory: subcategory, product: product)
      end
    end

    trait :with_contract do
      after(:create) do |product|
        contract = create(:contract)
        create(:product_contract, contract: contract, product: product)
      end
    end

    trait :with_draft do
      after(:create) do |product|
        user = create(:user, :as_product_owner)
        product.name = "New Name"
        product.draft_creation
        product.draft.update_attributes(whodunnit: user.id)
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

    trait :with_review do
      after(:create) do |product|
        review = create(:review)
        create(:product_review, product: product, review: review)
      end
    end
  end
end
