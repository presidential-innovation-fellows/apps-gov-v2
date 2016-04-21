FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product-#{n}" }
    long_description "Lorem ipsum Aliqua pariatur dolor pariatur fugiat."
    short_description "Lorem ipsum Sed non est ut sed nisi fugiat eu qui dolor."
    url "https://pif.gov/pizza-tracker"
    logo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'sample-logo.png'), 'image/png') }
  end
end
