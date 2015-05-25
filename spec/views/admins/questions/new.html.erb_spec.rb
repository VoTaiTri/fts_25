require "rails_helper"

RSpec.describe "admins/questions/new", type: :view do
  before :each do
    @question = FactoryGirl.build :question
  end

  it "request to questions controller and new action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/questions"
    expect(controller.request.path_parameters[:action]).to eq "new"
  end

  it "display the title of edit form" do
    render
    expect(rendered).to include "New Question"
  end

  it "display the form partial for fill questions info" do
    assign :question, @question
    render
    expect(view).to render_template partial: "admins/questions/_form"
  end
end
