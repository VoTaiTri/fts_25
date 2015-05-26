require "rails_helper"

RSpec.describe "route for User", type: :routing do

  it "routes admin_user_path to users controller and shown action" do
    @user = FactoryGirl.create :user
     expect(get: admins_user_path(@user)).
       to route_to controller: "admins/users", action: "show", id: "#{@user.id}"
  end

  it "routes admins_users_path to users controller and index action" do
     expect(get: admins_users_path).
       to route_to controller: "admins/users", action: "index"
  end

  it "routes admins_users_path to users controller and destroy action" do
    @user = FactoryGirl.create :user
     expect(delete: admins_user_path(@user)).
       to route_to controller: "admins/users", action: "destroy", id: "#{@user.id}"
  end
end
