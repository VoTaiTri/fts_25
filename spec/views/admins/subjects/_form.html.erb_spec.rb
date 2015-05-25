require "rails_helper"

RSpec.describe "admins/subjects/_form", type: :view do
  before :each do
    @subject = FactoryGirl.create :subject
  end

  it "no render from other action directly" do
    expect(controller.request.path_parameters[:action]).to be_nil
  end

  it "display partial _error_message and _option_fields" do
    render
    expect(view).to render_template partial: "shared/_error_messages"
  end

  it "display the _error massage partial when have error" do
    @subject.name = ""
    @subject.save
    render "shared/error_messages", object: @subject
    expect(rendered).to include "Name can&#39;t be blank"
  end
end
