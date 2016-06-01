FactoryGirl.define do
  factory :ato_type do
    description "Lorem ipsum Eu sed minim dolor consectetur proident est dolor."
    sequence(:name) { |n| "ATO-#{n}" }
  end
end
