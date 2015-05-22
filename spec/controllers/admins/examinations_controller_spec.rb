require "rails_helper"

RSpec.describe Admins::ExaminationsController, type: :controller do
  before :each do
    @admin_user = FactoryGirl.create :user, role: :admin
    sign_in :admin, @admin_user
    @examination = FactoryGirl.build :examination
  end

  describe "GET #index" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      get :index
      expect(response).to redirect_to new_admin_session_path
    end

    it "response to render template index of examination" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #show" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @examination.save
      get :show, admin_id: @admin_user.id, id: @examination.id,
                 user_id: @examination.user.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "response to show examination page" do
      @examination.save
      get :show, admin_id: @admin_user.id, id: @examination.id,
                                           user_id: @examination.user.id
      expect(response).to render_template "show"
    end
  end

  describe "GET #edit" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @examination.save
      get :edit, admin_id: @admin_user.id, id: @examination.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "response to render edit page for user correct examination" do
      @examination.save
      get :edit, admin_id: @admin_user.id, id: @examination.id
      expect(response).to render_template "edit"
    end
  end

  describe "PATCH #update" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @examination.save
      patch :update, admin_id: @admin_user.id, id: @examination.id,
                     examination: @examination.attributes.except("id")
      expect(response).to redirect_to new_admin_session_path
    end

    it "response to render show template if fail to update examination" do
      @examination.save
      @examination.subject = nil
      patch :update, admin_id: @admin_user.id, id: @examination.id,
                     examination: @examination.attributes.except("id")
      expect(response).to render_template "show"
      expect(flash[:danger]).to be_present
    end

    it "response to redirect to examination index after update successfully" do
      @examination.save
      @examination.status = "Corrected"
      patch :update, admin_id: @admin_user.id, id: @examination.id,
                     examination: @examination.attributes.except("id")
      expect(response).to redirect_to admins_examinations_path
      expect(flash[:success]).to be_present
    end
  end
end
