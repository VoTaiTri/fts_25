require "rails_helper"

RSpec.describe "admins/questions/edit", type: :view do
  before :each do
    @question = FactoryGirl.create :question
  end

  it "request to questions controller and edit action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/questions"
    expect(controller.request.path_parameters[:action]).to eq "edit"
  end

  it "display the title of edit form" do
    render
    expect(rendered).to include "Edit Question"
  end

  it "display the partial of form" do
    render
    expect(view).to render_template partial: "admins/questions/_form"
  end
end
