FactoryGirl.define do
  factory :review do
    content {Faker::Lorem.sentence}
  end
end
