Given(/^I have existing account as follow:$/) do |table|
  @user = FactoryGirl.create :user, table.rows_hash
end

Given(/^I visit login page$/) do
  visit new_user_session_path
end

When(/^I fill in "(.*?)", "(.*?)" and click "(.*?)"$/) do |email, password, button|
  fill_in "user[email]", with: email
  fill_in "user[password]", with: password
  click_button button
end

Then(/^I should see message say "(.*?)"$/) do |msg|
  expect(page).to have_content(msg)
end

Then(/^I visit home page$/) do
  visit root_path
end

Given(/^I want to log out$/) do
  visit logout_path
end
