FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    role 0
    password 12345678
    password_confirmation 12345678
  end
end
