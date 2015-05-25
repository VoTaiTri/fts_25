require "rails_helper"

RSpec.describe "admins/examinations/_examination", type: :view do  
  before :each do
    @examination = FactoryGirl.create :examination
  end

  it "display an examination the _examination partial in admins" do
    render "admins/examinations/examination", examination: @examination
    expect(rendered).to include @examination.subject.name
  end

  it "display two examinations the _examination partial in admins" do
    other_subject = FactoryGirl.create :subject, name: "Ruby on Rail"
    other_exam = FactoryGirl.create :examination, subject: other_subject
    render "admins/examinations/examination", examination: @examination
    render "admins/examinations/examination", examination: other_exam
    expect(rendered).to include @examination.subject.name
    expect(rendered).to include other_exam.subject.name
  end
end
