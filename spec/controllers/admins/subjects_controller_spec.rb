require "rails_helper"

RSpec.describe Admins::SubjectsController, type: :controller do
  before :each do
    @admin_user = FactoryGirl.create :user, role: :admin
    @subject = FactoryGirl.build :subject
    sign_in :admin, @admin_user
  end

  describe "GET #new" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      get :new
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to show fill for create subject if Admin signed in" do
      get :new
      expect(response).to render_template "new"
    end
  end
  
  describe "POST #create" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      post :create, admin_id: @admin_user.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to render new template if create fail" do
      @subject.duration = -1
      post :create, admin_id: @admin_user.id,
                    subject: @subject.attributes.except("id")
      expect(response).to render_template "new"
      expect(flash[:danger]).to be_present
    end

    it "should response to subject index after save is success" do
      post :create, admin_id: @admin_user.id,
                    subject: @subject.attributes.except("id")
      expect(response).to redirect_to admins_subjects_path
      expect(flash[:success]).to be_present
    end
  end

  describe "GET #index" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      get :index
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to show all subject if Admin signed in" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #show" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @subject.save
      get :show, admin_id: @admin_user.id, id: @subject.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to subject info detail" do
      @subject.save
      get :show, admin_id: @admin_user.id, id: @subject.id
      expect(response).to render_template "show"
    end
  end

  describe "GET #edit" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @subject.save
      get :edit, admin_id: @admin_user.id, id: @subject.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response shop fill for update subject info" do
      @subject.save
      get :edit, admin_id: @admin_user.id, id: @subject.id
      expect(response).to render_template "edit"
    end
  end

  describe "PATCH #update" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @subject.save
      patch :update, admin_id: @admin_user.id, id: @subject.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to show edit template if update fail" do
      @subject.save
      @subject.duration ="wer"
      patch :update, admin_id: @admin_user.id, id: @subject.id,
                     subject: @subject.attributes.except("id")
      expect(response).to render_template "edit"
      expect(flash[:danger]).to be_present
    end

    it "should response to show all subject when update success" do
      @subject.save
      @subject.duration ="30"
      patch :update, admin_id: @admin_user.id, id: @subject.id,
                     subject: @subject.attributes.except("id")
      expect(response).to redirect_to admins_subjects_path
      expect(flash[:success]).to be_present
    end
  end

  describe "DELETE #destroy" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @subject.save
      delete :destroy, admin_id: @admin_user.id, id: @subject.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to show all subject after delete success" do
      @subject.save
      delete :destroy, admin_id: @admin_user.id, id: @subject.id
      expect(response).to redirect_to admins_subjects_path
      expect(flash[:success]).to be_present
    end
  end
end
