require "rails_helper"

RSpec.describe Subject, type: :model do  
  before :each do
    @subject = FactoryGirl.build :subject
  end
  
  it "should be valid" do
    expect(@subject).to be_valid
  end

  it "should invalid when name is empty" do
    @subject.name = ""
    expect(@subject).not_to be_valid
  end

  it "should invalid when name length is long than 50" do
    @subject.name = "Aaaaaaaaaaa" * 10
    expect(@subject).not_to be_valid
  end

  it "should invalid when duration is nil" do
    @subject.duration = nil
    expect(@subject).not_to be_valid
  end

  it "should invalid when duration is not number" do
    @subject.duration = "ASSD"
    expect(@subject).not_to be_valid
  end

  it "should invalid when duration is <= 0" do
    @subject.duration = 0
    expect(@subject).not_to be_valid
  end

  context "Association with Question" do
    it "could have one question" do      
      @subject = FactoryGirl.create :subject_with_one_question
      expect(@subject.questions.count).to eql 1
    end

    it "could have many questions" do
      @subject = FactoryGirl.create :subject_with_10_questions
      expect(@subject.questions.count).to eql 10
    end
  end

  context "Association with Examination" do
    it "could be tested with one Examination" do      
      @subject = FactoryGirl.create :subject_with_one_examinations
      expect(@subject.examinations.count).to eql 1
    end

    it "could have many questions" do
      @subject = FactoryGirl.create :subject_with_4_examinations
      expect(@subject.examinations.count).to eql 4
    end
  end
end
