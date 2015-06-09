FactoryGirl.define do
  factory :review do
    association :book, factory: :book
    association :user, factory: :user
    content {Faker::Lorem.sentence}
  end
end
