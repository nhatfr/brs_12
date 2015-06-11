FactoryGirl.define do
  factory :book do
    title {Faker::Lorem.sentence(3, true, 3)}
    author {Faker::Name.name}
    ISBN {Faker::Number.number(10)}
    rating {1 + rand(5)}
    description {Faker::Lorem.paragraph(1, true, 6)}
    picture {File.new("#{Rails.root}/spec/photos/#{1+rand(12)}.jpeg")}
  end
end
