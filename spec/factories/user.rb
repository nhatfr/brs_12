FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    role 0
    password 12345678
    password_confirmation 12345678
    after(:create) {|user| user.follow User.find rand(1..user.id)}
  end
end
