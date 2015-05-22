require "rails_helper"

RSpec.describe UsersController, type: :controller do
  before :each do
    @user = FactoryGirl. create :user
  end
  describe "GET #show" do
    it "responds by showing the user information" do
      get :show, id: @user.id
      expect(response).to render_template "show"
    end
  end
end
