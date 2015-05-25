require "rails_helper"

RSpec.describe "admins/users/_user", type: :view do  
  before :each do
    @user = FactoryGirl.create :user
  end

  it "no render from other action directly" do
    expect(controller.request.path_parameters[:action]).to be_nil
  end

  it "display the detail information of user" do
    render "admins/users/user", user: @user
    expect(rendered).to include @user.username
  end
end
