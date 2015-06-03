puts "Create admin"
FactoryGirl.create :user, email: "admin@gmail.com", role: 1

puts "Create users"
FactoryGirl.create :user, email: "khanhkhanh@gmail.com"
50.times {FactoryGirl.create :user}

puts "Create categories"
20.times {FactoryGirl.create :category}
