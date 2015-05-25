require "rails_helper"

RSpec.describe "users/show", type: :view do
  before :each do
    @user = FactoryGirl.create :user
  end
  it "display the detain information of user" do
    assign :user, @user
    render
    expect(rendered).to include @user.email, @user.username
  end
end
