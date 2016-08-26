FactoryGirl.define do
  factory :subcategory do
    sequence(:name) { |n| "Subcategory-#{n}" }
    category

    trait :with_products do
      after(:create) do |subcategory|
        products = create_list(:product, 3)
        sub_subcategory = create(:sub_subcategory, subcategory: subcategory)
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
