Given(/^there are some examination took by the user$/) do |table|
  table.map_headers! "subject" => :subject, "user" => "user"
  table.hashes.each do |hash|
    subject = FactoryGirl.create :subject_with_10_questions, name: hash[:subject]
    user = FactoryGirl.create :user, username: hash[:user]
    FactoryGirl.create :examination, subject: subject, user: user
  end
end

Given(/^I visit correction page$/) do
  @examination = Examination.first
  visit edit_admins_examination_path(@examination)
end

Given(/^I mark some answer as correct$/) do
  @examination.answer_sheets.limit(3).each_with_index do |answer_sheet, index|
    id = "examination_answer_sheets_attributes_#{index}_correct"
    find("input##{id}").set(true)
  end
end

Then(/^examination should change status to "(.*?)"$/) do |status|
  expect(@examination.reload.status).to eq(status)
end

Given(/^I visit examination index page$/) do
  visit admins_examinations_path
end

Then(/^the page should show examination subject name$/) do
  Examination.all.each do |examination|
    expect(page).to have_content(examination.subject.name)
  end
end

Then(/^"(.*?)" link$/) do |correction_link|
  expect(page).to have_selector("a", text: correction_link)
end

Given(/^I visit first examination show page$/) do
  @examination = Examination.first
  visit admins_user_examination_path(@examination.user, @examination)
end

Then(/^I should see page with content "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end
