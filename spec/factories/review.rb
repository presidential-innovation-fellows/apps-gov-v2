FactoryGirl.define do
  factory :review do
    description "Cool review Theodore Brosevelt."
    sequence(:name) { |n| "Review-#{n}" }
    sequence(:slug) { |n| "review-#{n}" }
  end
end
