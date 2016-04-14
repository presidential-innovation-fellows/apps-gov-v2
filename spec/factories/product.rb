FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product-#{n}" }
    logo_file_name { "spec/fixtures/sample-logo.png" }
    long_description "Lorem ipsum Aliqua pariatur dolor pariatur fugiat."
    short_description "Lorem ipsum Sed non est ut sed nisi fugiat eu qui dolor."
    url "https://pif.gov/pizza-tracker"
  end
end
