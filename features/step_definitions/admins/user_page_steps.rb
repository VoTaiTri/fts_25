Given(/^there are some users who have registered as follow:$/) do |table|
  table.map_headers! "username" => :username, "email" => :email
  table.hashes.each {|hash| FactoryGirl.create :user, hash}
end

Given(/^I visit user index page$/) do
  visit admins_users_path
end

Then(/^the page should have a list of user name$/) do
  User.all.each do |user|
    expect(page).to have_selector("ul#users > li", text: user.username)
  end
end

Given(/^I visit first user show page$/) do
  @user = User.first
  visit admins_user_path(@user)
end

Then(/^I should see page with content username and email$/) do
  expect(page).to have_content(@user.username)
  expect(page).to have_content(@user.email)
end

Then(/^a list of examination histories$/) do
  expect(page).to have_selector("ul#examinations > li", count: @user.examinations.count)
end

When(/^I click on "(.*?)" link User should decrease by 1$/) do |delete_link|
  expect { click_link delete_link, match: :prefer_exact }.to change(User, :count).by(-1)
end
