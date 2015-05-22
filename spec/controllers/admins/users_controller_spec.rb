require "rails_helper"

RSpec.describe Admins::UsersController, type: :controller do
  before :each do
    @admin_user = FactoryGirl.create :user, role: :admin
    @other_user = FactoryGirl.create :user, role: :normal
    sign_in :admin, @admin_user
  end

  describe "GET #index" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      get :index
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to show user if Admin signed in" do
      get :index
      expect(response).to render_template "index"
    end

  end

  describe "GET #show" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      get :show, admin_id: @admin_user.id, id: @other_user.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to display user information" do
      get :show, admin_id: @admin_user.id, id: @other_user.id
      expect(response).to render_template "show"
    end
  end

  describe "DELETE #destroy" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      delete :destroy, admin_id: @admin_user.id, id: @other_user.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response index page after delete user" do
      delete :destroy, admin_id: @admin_user.id, id: @other_user.id
      expect(response).to redirect_to admins_users_path
      expect(flash[:success]).to be_present
    end
  end
end
