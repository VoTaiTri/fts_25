require "rails_helper"

RSpec.describe Examination, type: :model do  
  before :each do
    @exam = FactoryGirl.build :examination
  end

  it "should be valid" do
    expect(@exam).to be_valid
  end

  it "should has status default to Start" do    
    @exam.save
    expect(@exam.status).to eql "Start"
  end

  context "Association with User" do
    it "should invalid when User is nil" do
      @exam.user = nil
      expect(@exam).not_to be_valid
    end
  end

  context "Association with Subject" do
    it "should invalid when Subject is nil" do
      @exam.subject =nil
      expect(@exam).not_to be_valid
    end
  end

  context "Association with AnswerSheet" do
    it "could be used on one AnswerSheet" do
      @exam = FactoryGirl.create :examination_with_one_answer_sheet
      expect(@exam.answer_sheets.count).to eql 1
    end

    it "could be used on many AnswerSheet" do
      @exam = FactoryGirl.create :examination_with_4_answer_sheets
      expect(@exam.answer_sheets.count).to eql 4
    end
  end
end
