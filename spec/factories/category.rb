FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Category-#{n}" }

    trait :with_products do
      after(:create) do |category|
        products = create_list(:product, 3)
        products.each do |product|
          create(:product_category, category: category, product: product)
        end
      end
    end
  end
end
