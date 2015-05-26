require "rails_helper"

RSpec.describe "route for Ecamination", type: :routing do
  
  it "routes examinations_path to examinations controller and index action" do
    expect(get: examinations_path).
      to route_to controller: "examinations", action: "index"
  end

  it "routes examination_path to examinations controller and shown action" do
    @examination = FactoryGirl.create :examination
    expect(get: examination_path(@examination)).
      to route_to controller: "examinations", action: "show", id: "#{@examination.id}"
  end

  it "routes examinations_path to examinations controller and create action" do
    expect(post: examinations_path).
      to route_to controller: "examinations", action: "create"
  end
  
  it "routes examination_path to examinations controller and update action" do
    @examination = FactoryGirl.create :examination
    expect(patch: examination_path(@examination)).
      to route_to controller: "examinations", action: "update", id: "#{@examination.id}"
  end
end
