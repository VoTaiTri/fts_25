require "rails_helper"

RSpec.describe "admins/questions/_form", type: :view do
  before :each do
    @question = FactoryGirl.create :question
  end

  it "no render from other action directly" do
    expect(controller.request.path_parameters[:action]).to be_nil
  end

  it "display list of all subject for admin to select for create question" do
    render
    expect(rendered).to include Subject.all.first.name, Subject.all.last.name
  end

  it "display the _error massage partial when have error" do
    @question.subject = nil
    @question.save
    render "shared/error_messages", object: @question
    expect(rendered).to include "Subject can&#39;t be blank"
  end

  it "display the option fields partial" do
    render
    expect(view).to render_template partial: "admins/questions/_option_fields"
  end

  it "display partial _error_message and _option_fields" do
    render
    expect(view).to render_template partial: "shared/_error_messages"
    expect(view).to render_template partial: "admins/questions/_option_fields"
  end
end
