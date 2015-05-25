require "rails_helper"

RSpec.describe "admins/subjects/edit", type: :view do  
  before :each do
    @subject = FactoryGirl.create :subject
  end

  it "request to questions controller and edit action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/subjects"
    expect(controller.request.path_parameters[:action]).to eq "edit"
  end

  it "display the title of edit form" do
    render
    expect(rendered).to include "Edit Subject"
  end

  it "display the partial of form" do
    render
    expect(view).to render_template partial: "admins/subjects/_form"
  end
end
