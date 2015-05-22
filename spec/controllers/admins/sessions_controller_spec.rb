require "rails_helper"

RSpec.describe Admins::SessionsController, type: :controller do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @admin_user = FactoryGirl.create :user, role: :admin
  end
  describe "POST #create" do
    it "responds by redirect to Admin page when Sign up success" do
      post :create, admin: @admin_user.attributes.except("id")
      expect(response).not_to redirect_to new_admin_session_path
      expect(flash[:alert]).to be_present
    end

    it "response to admin sign in when fill invalid email" do
      @admin_user.email = "ssssssssssss"
      post :create, admin: @admin_user.attributes.except("id")
      expect(response).to redirect_to new_admin_session_path
      expect(flash[:alert]).to be_present
    end

    it "response to admin sign in when fill invalid password" do
      @admin_user.email = "ssssssssssss"
      post :create, admin: @admin_user.attributes.except("id")
      expect(response).to redirect_to new_admin_session_path
      expect(flash[:alert]).to be_present
    end
  end
end
