FactoryGirl.define do
  factory :book do
    title {Faker::Lorem.sentence(3, true, 3)}
    author {Faker::Name.name}
    ISBN {Faker::Number.number(10)}
    description {Faker::Lorem.paragraph(1, true, 6)}
  end
end
