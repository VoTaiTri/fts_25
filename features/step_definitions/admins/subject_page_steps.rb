Given(/^I visit new subject page$/) do
  visit new_admins_subject_path
end

When(/^I fill the form with "(.*?)" and "(.*?)" and click "(.*?)"$/) do |name, duration, button|
  fill_in "subject[name]", with: name
  fill_in "subject[duration]", with: duration
  click_button button
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

Then(/^I click on "(.*?)" link Subject should decrease by 1$/) do |delete_link|
  expect {click_link delete_link}.to change(Subject, :count).by(-1)
end

