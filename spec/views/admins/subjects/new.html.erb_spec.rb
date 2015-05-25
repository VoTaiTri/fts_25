require "rails_helper"

RSpec.describe "admins/subjects/new", type: :view do  
  before :each do
    @subject = FactoryGirl.build :subject
  end

  it "request to subjects controller and new action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/subjects"
    expect(controller.request.path_parameters[:action]).to eq "new"
  end

  it "display the title of edit form" do
    render
    expect(rendered).to include "New Subject"
  end

  it "display the form partial for fill subject info" do
    render
    expect(view).to render_template partial: "admins/subjects/_form"
  end

  it "display the form partial for fill subject info and error message" do
    @subject.duration = -1
    @subject.save
    render
    expect(view).to render_template partial: "admins/subjects/_form"
    expect(rendered).to include "Duration must be greater than 0"
  end
end
