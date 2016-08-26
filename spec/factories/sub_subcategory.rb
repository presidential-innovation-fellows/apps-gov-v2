FactoryGirl.define do
  factory :sub_subcategory do
    sequence(:name) { |n| "SubSubcategory-#{n}" }
    subcategory

    trait :with_products do
      after(:create) do |sub_subcategory|
        products = create_list(:product, 3)
        products.each do |product|
          create(
            :product_sub_subcategory,
            sub_subcategory: sub_subcategory,
            product: product
          )
        end
      end
    end
  end
end
