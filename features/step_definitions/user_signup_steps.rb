Given(/^I visit signup page$/) do
  visit new_user_registration_path
end

When(/^I fill in the form like follow and click "(.*?)":$/) do |button, table|
  @email = table.rows_hash[:email]
  table.rows_hash.each do |key, value|
    fill_in "user[#{key}]", with: value
  end
  click_button button
end

Then(/^I should have an account$/) do
  users = User.where email: @email
  expect(users).not_to be_nil
  expect(users.count).to eq(1)
end

Then(/^I should see the message say "(.*?)"$/) do |message|
  expect(page).to have_content message
end

Then(/^the page should have element with id "(.*?)"$/) do |id|
  expect(page).to have_selector "div##{id}"
end
