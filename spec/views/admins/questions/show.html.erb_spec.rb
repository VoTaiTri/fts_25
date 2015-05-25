require "rails_helper"

RSpec.describe "admins/questions/show", type: :view do
  before :each do
    @question = FactoryGirl.create :question
  end

  it "request to questions controller and show action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/questions"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  it "display the title of edit form" do
    render
    expect(rendered).to include "Question&#39;s Details"
  end

  it "display more information about Question without option" do
    render
    expect(rendered).to include @question.description
  end

  it "display more information about Question have option" do
    @question = FactoryGirl.create :question_with_options
    render
    expect(rendered).to include @question.description,
                                @question.options.first.description,
                                @question.options.last.description
  end
end
