puts "Create admin"
FactoryGirl.create :user, email: "admin@gmail.com", role: 1

puts "Create users"
FactoryGirl.create :user, email: "khanhkhanh@gmail.com"
20.times {FactoryGirl.create :user}

puts "Create categories"
20.times {FactoryGirl.create :category}

puts "Create books"
20.times {FactoryGirl.create :book}

puts "Create reviews"
users = User.order(:created_at).all
books = Book.order(:created_at).all
20.times do |n|
  content = Faker::Lorem.sentence(3)
  users.each {|user| user.reviews.create!(content: content, book_id: n)}
end
