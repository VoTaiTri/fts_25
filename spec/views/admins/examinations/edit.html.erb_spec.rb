require "rails_helper"

RSpec.describe "admins/examinations/edit", type: :view do  
  before :each  do
    @examination = FactoryGirl.create :examination
  end

  it "display the username of user who take the examination" do
    render
    expect(rendered).to include @examination.user.username
  end

  it "display list questions without option for Admin to correct" do
    @examination = FactoryGirl.create :examination_with_4_answer_sheets
    render
    expect(rendered).to include @examination.answer_sheets.first.answer_content
  end
end
