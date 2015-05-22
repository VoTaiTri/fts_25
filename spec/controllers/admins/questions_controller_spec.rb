require "rails_helper"

RSpec.describe Admins::QuestionsController, type: :controller do
  before :each do
    @admin_user = FactoryGirl.create :user, role: :admin
    sign_in :admin, @admin_user
    @question = FactoryGirl.build :question
  end

  describe "GET #index" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      get :index
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to show all questions" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #show" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @question.save
      get :show, admin_id: @admin_user.id, id: @question.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to show question detail" do
      @question.save
      get :show, admin_id: @admin_user.id, id: @question.id
      expect(response).to render_template "show"
    end
  end

  describe "GET #new" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      get :new
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response show fill for use input question info" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "POST #create" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      post :create, admin_id: @admin_user.id,
                    question: @question.attributes.except("id")
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to new for ask you fill again when error occurs" do
      @question.subject = nil
      post :create, admin_id: @admin_user.id,
                    question: @question.attributes.except("id")
      expect(response).to render_template "new"
      expect(flash[:danger]).to be_present
    end

    it "should question index when successful create question" do
      post :create, admin_id: @admin_user.id,
                    question: @question.attributes.except("id")
      expect(response).to redirect_to admins_questions_path
      expect(flash[:success]).to be_present
    end
  end

  describe "GET #edit" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @question.save
      get :edit, admin_id: @admin_user.id, id: @question.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to edit temple for user edit question" do
      @question.save
      get :edit, admin_id: @admin_user.id, id: @question.id
      expect(response).to render_template "edit"
    end
  end

  describe "PATCH #update" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @question.save
      patch :update, admin_id: @admin_user.id, id: @question.id,
                     question: @question.attributes.except("id")
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to edit template when update question fail" do
      @question.save
      @question.subject = nil
      patch :update, admin_id: @admin_user.id, id: @question.id,
                     question: @question.attributes.except("id")
      expect(response).to render_template "edit"
      expect(flash[:danger]).to be_present
    end

    it "should response to index page of questions when update success" do
      @question.save
      @question.description = "What is you loved coding?"
      patch :update, admin_id: @admin_user.id, id: @question.id,
                     question: @question.attributes.except("id")
      expect(response).to redirect_to admins_questions_path
      expect(flash[:success]).to be_present
    end
  end

  describe "DELETE #destroy" do
    it "should response to Admin sign in page if user not sign in" do
      sign_out :admin
      @question.save
      delete :destroy, admin_id: @admin_user.id, id: @question.id
      expect(response).to redirect_to new_admin_session_path
    end

    it "should response to questions index page after delete question success" do
      @question.save
      delete :destroy, admin_id: @admin_user.id, id: @question.id
      expect(response).to redirect_to admins_questions_path
      expect(flash[:success]).to be_present
    end
  end
end
