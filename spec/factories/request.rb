FactoryGirl.define do
  factory :request do
    association :user, factory: :user
    book_name {Faker::Name.name}
    author {Faker::Name.name}
    ISBN {Faker::Number.number(10)}
    description {Faker::Lorem.paragraph(1, true, 6)}
  end
end
