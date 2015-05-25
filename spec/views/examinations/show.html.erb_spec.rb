require "rails_helper"

RSpec.describe "examinations/show", type: :view do
  before :each do
    @examination = FactoryGirl.create :examination, end_testing_at: Time.now
  end

  it "request to examinations controller and show action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "examinations"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  it "display the name of subject that they are doing" do
    render
    expect(rendered).to include @examination.subject.name
  end

  it "display the list of questions in answer sheet of subject" do
    @examination = FactoryGirl.create :examination_with_4_answer_sheets,
                                       end_testing_at: Time.now
    render
    expect(rendered).to include @examination.questions.first.description
    expect(rendered).to include @examination.questions.last.description
  end
end
