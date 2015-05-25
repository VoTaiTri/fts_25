Given(/^I have signin as an admin$/) do
  admin = FactoryGirl.create :user, role: :admin
  visit new_admin_session_path
  fill_in "admin[email]", with: admin.email
  fill_in "admin[password]", with: admin.password
  click_button "Sign in"
end

Given(/^I have subject as follow:$/) do |table|
  table.map_headers! "name" => :name, "duration" => :duration
  table.hashes.each {|hash| FactoryGirl.create :subject, hash}
end

When(/^I click on "(.*?)"$/) do |add_option_link|
  click_link add_option_link
end

Then(/^the page should have textbox and link "(.*?)"$/) do |remove_option_link|
  expect(page).to have_selector(:xpath, "//input")
  expect(page).to have_selector(:xpath, "//a/text()", remove_option_link)
end

Given(/^I visit new question page$/) do
  visit new_admins_question_path
end

Then(/^I should see a form with title "(.*?)"$/) do |form_title|
  expect(page).to have_content(form_title)
end

When(/^I choose subject "(.*?)"$/) do |subject|
  select subject, from: "question[subject_id]"
end

When(/^fill in description "(.*?)"$/) do |description|
  fill_in "question[description]", with: description
end

When(/^click "(.*?)"$/) do |button|
  click_button button
end

Then(/^I should see a message "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

Then(/^one question with description "(.*?)" added to the database$/) do |description|
  expect(Question.where(description: description).count).to eq(1)
end

Then(/^the page should contain element with id "(.*?)"$/) do |id|
  expect(page).to have_selector("div##{id}")
end

Then(/^no question added to the database$/) do
  expect(Question.count).to eq(0)
end

Given(/^there is a question with description "(.*?)"$/) do |description|
  @question = FactoryGirl.create :question, description: description
end

When(/^I visit edit question page$/) do
  visit edit_admins_question_path(@question)
end

When(/^I change description to "(.*?)"$/) do |description|
  fill_in "question[description]", with: description
end

When(/^click "(.*?)" button$/) do |button|
  click_button button
end

Then(/^question should have description "(.*?)"$/) do |description|
  expect(@question.reload.description).to eq(description)
end

Then(/^subject should stay the same$/) do
  expect(Question.where(description: @question.description).count).to eq(1)
end

Given(/^I have question as bellow:$/) do |table|
  table.map_headers! "description" => :description
  table.hashes.each {|hash| FactoryGirl.create :question, hash}
end

When(/^I visit question index page$/) do
  visit admins_questions_path
end

Then(/^the page should have (\d+) question listing$/) do |number_of_questions|
  expect(page).to have_selector("ul#questions > li", count: number_of_questions)
end

Given(/^there is a question with description "(.*?)" and (\d+) options$/) do |description, option_count|
  @question = FactoryGirl.create :question_with_options, description: description
end

When(/^I visit question show page$/) do
  visit admins_question_path(@question)
end

Then(/^I should see page with content description "(.*?)"$/) do |description|
  expect(page).to have_content(description)
end

Then(/^the page should contain (\d+) options data$/) do |number_of_options|
  expect(page).to have_selector("tbody > tr", count: number_of_options)
end

When(/^I visit index page$/) do
  visit admins_questions_path
end

When(/^click on "(.*?)" link$/) do |delete_link|
  expect(Question.all.count).to eq(1)
  
  click_link delete_link
  Capybara.current_driver = :webkit
  page.driver.browser.accept_js_confirms
  Capybara.use_default_driver
end

Then(/^one question should be delete from the database$/) do
  expect(Question.all.count).to eq(0)
end
