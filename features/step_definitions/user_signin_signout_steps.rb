Given(/^I have an existing account as follow:$/) do |table|
  @user = FactoryGirl.create :user, table.rows_hash
end

Given(/^I visit signin page$/) do
  visit new_user_session_path
end

When(/^I fill in "(.*?)", "(.*?)" and click "(.*?)"$/) do |email, password, button|
  fill_in "user[email]", with: email
  fill_in "user[password]", with: password
  click_button button
end

Then(/^I should see message say "(.*?)"$/) do |success|
  expect(page).to have_content(success)
end

Given(/^I have already signed in with:$/) do |table|
  visit new_user_session_path
  table.rows_hash.each do |key, value|
    fill_in "user[#{key}]", with: value
  end
  click_button "Sign in"
end

When(/I click on "(.*?)" link/) do |link|
  click_link link
end

Then(/Then I should see message say "(.*?)"/) do |message|
  expect(page).to have_content(message)
end
