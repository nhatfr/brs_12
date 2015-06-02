puts "Create admin"
FactoryGirl.create :user, email: "admin@gmail.com", admin: true

puts "Create users"
FactoryGirl.create :user, email: "khanhkhanh@gmail.com"
8.times {
  user = FactoryGirl.create :user
}
