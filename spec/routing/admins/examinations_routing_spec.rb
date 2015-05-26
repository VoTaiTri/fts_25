require "rails_helper"

RSpec.describe "route for Examination", type: :routing do

  it "routes admin_examination_path to examinations controller and show action" do
    @user = FactoryGirl.create :user_with_4_examinations
    @examinations = @user.examinations
     expect(get: admins_user_examination_path(@user, @examinations.first)).
       to route_to controller: "admins/examinations", action: "show",
                    user_id: "#{@user.id}", id: "#{@examinations.first.id}"
  end

  it "routes admins_examinations_path to examinations controller and index action" do
     expect(get: admins_examinations_path).
       to route_to controller: "admins/examinations", action: "index"
  end

  it "routes admin_examination_path to examinations controller and edit action" do
    @examination = FactoryGirl.create :examination
     expect(get: edit_admins_examination_path(@examination)).
       to route_to controller: "admins/examinations", action: "edit", id: "#{@examination.id}"
  end

  it "routes admins_examinations_path to examinations controller and update action" do
    @examination = FactoryGirl.create :examination
     expect(patch: admins_examination_path(@examination)).
       to route_to controller: "admins/examinations", action: "update", id: "#{@examination.id}"
  end
end
