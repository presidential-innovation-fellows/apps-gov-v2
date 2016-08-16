FactoryGirl.define do
  factory :subcategory do
    sequence(:name) { |n| "Subcategory-#{n}" }
    category

    trait :with_products do
      after(:create) do |subcategory|
        products = create_list(:product, 3)
        products.each do |product|
          create(
            :product_subcategory,
            subcategory: subcategory,
            product: product
          )
        end
      end
    end
  end
end
