Given(/^I have an admin account as follow:$/) do |table|
  @user = FactoryGirl.create :user, table.rows_hash
end

Given(/^I visit admin signin page$/) do
  visit new_admin_session_path
end

When(/^I fill in my "(.*?)", "(.*?)" and click "(.*?)"$/) do |email, password, button|
  fill_in "admin[email]", with: email
  fill_in "admin[password]", with: password
  click_button button
end

Then(/^I should see message "(.*?)"$/) do |message|
  expect(page).to have_content message
end
