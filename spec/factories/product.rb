FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product-#{n}" }
    url "https://pif.gov/pizza-tracker"
    short_description "Lorem ipsum Sed non est ut sed nisi fugiat eu qui dolor."
    long_description "Lorem ipsum Aliqua pariatur dolor pariatur fugiat."
  end
end
