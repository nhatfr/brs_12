FactoryGirl.define do
  factory :comment do
    association :user, factory: :user
    association :review, factory: :review
    content {Faker::Lorem.sentence}
  end
end
