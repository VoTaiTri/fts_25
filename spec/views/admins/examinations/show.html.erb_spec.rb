require "rails_helper"

RSpec.describe "admins/examinations/show", type: :view do  
  before :each  do
    @examination = FactoryGirl.create :examination
  end

  it "display the infomation of examination" do
    render
    expect(rendered).to include @examination.subject.name, @examination.status,
                                @examination.total_questions.to_s,
                                @examination.user.username + "&#39;s examination result"
  end
end
