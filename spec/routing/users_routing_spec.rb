require "rails_helper"

RSpec.describe "route for Ecamination", type: :routing do
  it "routes user_path to users controller and shown action" do
    @user = FactoryGirl.create :user
    expect(get: user_path(@user)).
      to route_to controller: "users", action: "show", id: "#{@user.id}"
  end
end
