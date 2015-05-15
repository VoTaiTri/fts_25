Given(/^we have subjects like follow:$/) do |table|
  table.map_headers! "name" => :name, "duration" => :duration
  table.hashes.each {|hash| FactoryGirl.create :subject, hash}
end

When(/^I visit examination page$/) do
  visit examinations_path
end

Given(/^I have already signed in$/) do
  @user = FactoryGirl.create :user,
                     email: "norin@example.com",
                     password: "12345678",
                     password_confirmation: "12345678"
  visit new_user_session_path
  fill_in "user[email]", with: @user.email
  fill_in "user[password]", with: @user.password
  click_button "Sign in"
end

Then(/^I should see header with text "(.*?)" and button "(.*?)"$/) do |header, button|
  expect(page).to have_selector("//h1", text: header)
  expect(page).to have_selector("//input[type=submit][value=#{button}]")
end

When(/^I choose a subject and click "(.*?)"$/) do |button|
  click_button button
end

Then(/^I should see an examination with "(.*?)" link$/) do |link|
  expect(@user.examinations.count).to eq(1)
  expect(page).to have_selector("//a", text: link)
end
