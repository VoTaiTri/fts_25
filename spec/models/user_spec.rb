require "rails_helper"

RSpec.describe User, type: :model do  
  before :each do
    @user = FactoryGirl.build :user
  end

  it "show be valid" do
    expect(@user).to be_valid
  end    
  context "UserName" do
    it "should invalid when empty" do
      @user.username = ""
      expect(@user).not_to be_valid
    end

    it "should invalid when maximum length large than 50" do
      @user.username = "Rathanak" * 10
      expect(@user).not_to be_valid
    end

    it "should be uniqueness" do
      @user.username = "rathanak"
      @user.save
      other_user = FactoryGirl.build :user
      other_user.username = "rathanak"
      expect(other_user).not_to be_valid
    end
  end

  context "Email" do
    it "should invalid when empty" do
      @user.email = ""
      expect(@user).not_to be_valid
    end

    it "should invalid when maximum length large than 50" do
      @user.email = "rathanak" * 10 +"@yahoo.com"
      expect(@user).not_to be_valid
    end

    it "should be uniqueness" do
      @user.email = "rathanak@yahoo.com"
      @user.save
      other_user = FactoryGirl.build :user
      other_user.email = "rathanak@yahoo.com"
      expect(other_user).not_to be_valid
    end

    it "should invalid when wrong format" do
      @user.email = "rathanak@yahoo"
      expect(@user).not_to be_valid
    end

    it "should down-case after save" do
      @user.email = "RaThanak@Gmail.com"
      @user.save
      expect(@user.email).to eql "rathanak@gmail.com"
    end
  end
  
  context "Association with Examination" do
    it "should be able create one Examination" do      
      @user = FactoryGirl.create :user_with_one_examination
      expect(@user.examinations.count).to eql 1
    end

    it "should be able create many Examinations" do
      @user = FactoryGirl.create :user_with_4_examinations
      expect(@user.examinations.count).to eql 4
    end
  end
end
