require "rails_helper"

RSpec.describe AnswerSheet, type: :model do  
  before :each do
    @answer_sheet = FactoryGirl.build :answer_sheet
  end

  it "should be valid" do
    expect(@answer_sheet).to be_valid
  end

  context "Associate with Examination" do
    it "should invalid when Examination is nil" do
      @answer_sheet.examination = nil
      expect(@answer_sheet).not_to be_valid
    end
  end

  context "Associate with Question" do
    it "should invalid when Question is nil" do
      @answer_sheet.question = nil
      expect(@answer_sheet).not_to be_valid
    end
  end
end
