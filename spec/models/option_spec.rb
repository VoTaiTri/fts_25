require "rails_helper"

RSpec.describe Option, type: :model do
  before :each do
    @option = FactoryGirl.build :option
  end

  it "should be valid" do
    expect(@option).to be_valid
  end

  it "should invalid when description is empty" do
    @option.description = ""
    expect(@option).not_to be_valid
  end

  context "Association with Question" do
    it "should invalid when Question is nil" do
      @option.question = nil
      expect(@option).not_to be_valid
    end
  end

  context "Association with AnswerSheet" do
    it "could be used on one AnswerSheet" do
      @option = FactoryGirl.create :option_with_one_answer_sheet
      expect(@option.answer_sheets.count).to eql 1
    end

    it "could be used on many AnswerSheet" do
      @option = FactoryGirl.create :option_with_4_answer_sheets
      expect(@option.answer_sheets.count).to eql 4
    end
  end
end
