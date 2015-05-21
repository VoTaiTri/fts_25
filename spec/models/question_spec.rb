require "rails_helper"

RSpec.describe Question, type: :model do  
  before :each do
    @question = FactoryGirl.build :question
  end

  it "should be valid" do
    expect(@question).to be_valid
  end

  it "should invalid when description is empty" do
    @question.description = ""
    expect(@question).not_to be_valid
  end

  context "Association with Subject" do
    it "should invalid when subject is nil" do
      @question.subject = nil
      expect(@question).not_to be_valid
    end
  end

  context "Association with Option" do
    it "should have many options" do
      @question = FactoryGirl.create :question_with_options
      expect(@question.options.count).to eql 4
    end
  end

  context "Association with AnswerSheet" do
    it "could be used on one AnswerSheet" do
      @question = FactoryGirl.create :question_with_one_answer_sheet
      expect(@question.answer_sheets.count).to eql 1    end

    it "could be used on many AnswerSheet" do
      @question = FactoryGirl.create :question_with_4_answer_sheets
      expect(@question.answer_sheets.count).to eql 4
    end
  end
end
