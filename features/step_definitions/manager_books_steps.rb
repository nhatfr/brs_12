Given(/^I have books titled "(.*?)", "(.*?)"$/) do |title1, title2|
  @book = FactoryGirl.create(:book, title: title1)
  @another_book = FactoryGirl.create(:book, title: title2)
end

When(/^I go to list of books$/) do
  visit books_path
end

Then(/^I should see "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end

Given(/^a admin account as follow:$/) do |table|
  @admin = FactoryGirl.create :user, table.rows_hash
end

Given(/^I have a category named "(.*?)"$/) do |name|
  @category = FactoryGirl.create :category, name: name
end

Given(/^I logged in with email: "(.*?)" and password: "(.*?)" as Admin$/) do |email, password|
  visit new_user_session_path
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Log In"
end

Given(/^I have no books$/) do
  Book.delete_all
end

Then(/^I am on the list of books$/) do
  visit admin_books_path
end

When(/^I click "(.*?)"$/) do |link|
  click_link link
end

When(/^I chose in "(.*?)"$/) do |category|
  find("option[value='1']").click 
end

When(/^I click "(.*?)" button$/) do |value|
  find_button(value).click
end

Then(/^I return index book page$/) do
  visit admin_books_path
end

Then(/^I should have (\d+) book$/) do |count|
  Book.count.should == count.to_i
end

Given(/^I am on list of books$/) do
  visit admin_books_path
end

Given(/^I have a book$/) do
  @book = FactoryGirl.create :book
end

When(/^I click edit book link$/) do
  @book = Book.last
  visit edit_admin_book_path @book
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |feild, content|
  fill_in feild, with: content
end
