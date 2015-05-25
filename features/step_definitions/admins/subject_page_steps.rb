Given(/^I have signin as an admin$/) do
  admin = FactoryGirl.create :user, role: :admin
  visit new_admin_session_path
  fill_in "admin[email]", with: admin.email
  fill_in "admin[password]", with: admin.password
  click_button "Sign in"
end

Given(/^I visit new subject page$/) do
  visit new_admins_subject_path
end

Then(/^I should see a form with title "(.*?)"$/) do |title|
  expect(page).to have_content title
end

When(/^I fill the form with "(.*?)" and "(.*?)" and click "(.*?)"$/) do |name, duration, button|
  fill_in "subject[name]", with: name
  fill_in "subject[duration]", with: duration
  click_button button
end

Then(/^I should see a message "(.*?)"$/) do |message|
  expect(page).to have_content message
end

Then(/^the page should contain element with id "(.*?)"$/) do |id|
  expect(page).to have_selector "div##{id}"
end

Then(/^one subject with name "(.*?)" added to the database$/) do |name|
  expect(Subject.find_by_name name)
end

Then(/^no subject added to the database$/) do
  expect(Subject.all.count).to eq(0)
end

Given(/^there is a subject in the database with name "(.*?)" and duration "(.*?)"$/) do |name, duration|
  @subject = FactoryGirl.create :subject, name: name, duration: duration
end

When(/^I visit edit subject page$/) do
  visit edit_admins_subject_path(@subject)
end

When(/^I change name to "(.*?)"$/) do |name|
  fill_in "subject[name]", with: name
end

When(/^I change duration to "(.*?)"$/) do |duration|
  fill_in "subject[duration]", with: duration
end

When(/^click "(.*?)" button$/) do |button|
  click_button button
end

Then(/^subject should have name "(.*?)"$/) do |name|
  expect(Subject.find_by_name name).not_to be_nil
  expect(@subject.reload.name).to eq(name)
end

Then(/^subject should stay the same$/) do
  subject = Subject.first
  expect(subject).to eq(@subject)
end

Given(/^I have subject as bellow:$/) do |table|
  table.map_headers! "name" => :name, "duration" => :duration
  p table.hashes
  table.hashes.each {|hash| FactoryGirl.create :subject, hash}
end

When(/^I visit subject index page$/) do
  visit admins_subjects_path
end

Then(/^the page should have (\d+) subject listing$/) do |subject_count|
  expect(page).to have_selector("tbody > tr", count: subject_count)
end

When(/^I visit index page$/) do
  visit admins_subjects_path
end

When(/^I visit subject show page$/) do
  visit admins_subject_path(@subject)
end

Then(/^I should see page with content name "(.*?)" duration "(.*?)"$/) do |name, duration|
  expect(page).to have_content(name)
  expect(page).to have_content(duration)
end

When(/^click on "(.*?)" link$/) do |delete_link|
  expect(Subject.count).to eq(1)
  
  click_link delete_link
  Capybara.current_driver = :webkit
  page.driver.browser.accept_js_confirms
  Capybara.use_default_driver
end

Then(/^one subject should be delete from the database$/) do
  expect(Subject.count).to eq(0)
end

