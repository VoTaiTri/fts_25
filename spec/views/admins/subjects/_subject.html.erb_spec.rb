require "rails_helper"

RSpec.describe "admins/subjects/_subject", type: :view do  
  before :each do
    @subject = FactoryGirl.create :subject
  end

  it "no render from other action directly" do
    expect(controller.request.path_parameters[:action]).to be_nil
  end

  it "display the detail information of subject" do
    render "admins/subjects/subject", subject: @subject
    expect(rendered).to include @subject.id.to_s, @subject.name,
                                @subject.duration.to_s + " min"
  end
end
