require "rails_helper"

RSpec.describe "admins/users/index", type: :view do  
  before :each do
    5.times do |n|
      FactoryGirl.create :user
    end
    @users = User.all.paginate page: params[:page], per_page: Settings.page_size
  end

  it "display the title of index users" do
    render
    expect(rendered).to include "All User"
  end

  it "request to users controller and index action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/users"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end
end
