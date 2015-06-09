puts "Create admin"
FactoryGirl.create :user, email: "admin@gmail.com", role: 1

puts "Create users"
FactoryGirl.create :user, email: "khanhkhanh@gmail.com"
FactoryGirl.create :user, email: "normal@gmail.com"
20.times {FactoryGirl.create :user}

puts "Create categories"
10.times {FactoryGirl.create :category}

puts "Create books"
20.times {FactoryGirl.create :book}

puts "create reviews"
10.times {FactoryGirl.create :review}

puts "Create requests"
10.times {FactoryGirl.create :request}

