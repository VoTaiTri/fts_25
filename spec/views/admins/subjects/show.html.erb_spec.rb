require "rails_helper"

RSpec.describe "admins/subjects/show", type: :view do
  before :each do
    @subject = FactoryGirl.create :subject
  end

  it "request to subjects controller and show action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/subjects"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  it "display the title of edit form" do
    render
    expect(rendered).to include "Subject&#39;s Details"
  end

  it "display more information about subject" do
    render
    expect(rendered).to include @subject.name, @subject.duration.to_s
  end
end
