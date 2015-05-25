require "rails_helper"

RSpec.describe "admins/users/show", type: :view do  
  before :each do
    @user = FactoryGirl.create :user
  end

  it "request to users controller and show action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/users"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  it "display the title of User" do
    render
    expect(rendered).to include "User&#39;s Profile"
  end

  it "display more information about user" do
    render
    expect(rendered).to include @user.username, @user.email
  end
end
