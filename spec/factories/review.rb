FactoryGirl.define do
  factory :review do
    association :book, factory: :book
    association :user, factory: :user
    thesis_statement {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
  end
end
