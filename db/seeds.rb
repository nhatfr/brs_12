puts "Create admin"
FactoryGirl.create :user, email: "admin@gmail.com", role: 1

puts "Create users"
FactoryGirl.create :user, email: "khanhkhanh@gmail.com"
50.times {FactoryGirl.create :user}

puts "Create categories"
20.times {FactoryGirl.create :category}

puts "Create book"
100.times {FactoryGirl.create :book}

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }