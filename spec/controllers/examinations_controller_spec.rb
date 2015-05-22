require "rails_helper"

RSpec.describe ExaminationsController, type: :controller do
  before :each do
    @user = FactoryGirl.create :user
    sign_in :user, @user
    @exam = FactoryGirl.build :examination, user: @user
  end

  describe "GET #index" do
    it "should respond to sign in page if user not sign in" do
      sign_out :user
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    it "should responds to index.html.erb when user is login" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #show" do
    it "should respond to sign in page if user not sign in" do
      sign_out :user
      @exam.save
      get :show, id: @exam.id
      expect(response).to redirect_to new_user_session_path
    end

    it "should respond to show the examination detail" do
      @exam.save
      get :show, id: @exam.id
      expect(response).to render_template "show"
    end
  end

  describe "POST #create" do
    it "should respond to sign in page if user not sign in" do
      sign_out :user
      post :create
      expect(response).to redirect_to new_user_session_path
    end

    it "should display success message and redirect to index path" do
      post :create, examination: @exam.attributes.except("id")
      expect(response).to redirect_to examinations_path
      expect(flash[:success]).to be_present
      expect(@user.examinations.count).to eq 1
    end

    it "should display fail message to create and redirect to index path" do
      @exam.subject = nil
      post :create, examination: @exam.attributes.except("id")
      expect(response).to redirect_to examinations_path
      expect(flash[:danger]).to be_present
      expect(@user.examinations.count).to eq 0
    end
  end

  describe "PATCH #update" do
    it "should respond to sign in page if user not sign in" do
      sign_out :user
      @exam.save
      patch :update, id: @exam.id
      expect(response).to redirect_to new_user_session_path
    end

    it "respond to show exam when user click on start" do
      @exam.save
      patch :update, id: @exam.id, status: "Start"
      @exam = @exam.reload
      expect(@exam.end_testing_at).not_to be_nil
      expect(@exam.status).not_to eq "Start"
      expect(@exam.status).to eq "View"
      expect(response).to redirect_to @exam
    end

    it "Update Exam and redirect to show exam display success massage" do
      @exam.status = "View"
      @exam.end_testing_at = Time.now
      @exam.save
      patch :update, id: @exam.id, examination: @exam.attributes.except("id")
      @exam = @exam.reload
      expect(@exam.submited_duration).to be > 0      
      expect(flash[:success]).to be_present      
      expect(response).to redirect_to @exam
    end

    it "Display fail message and redirect to show exam" do
      @exam.status = "View"
      @exam.save
      @exam.subject = nil
      patch :update, id: @exam.id, examination: @exam.attributes.except("id")
      @exam = @exam.reload
      expect(flash[:danger]).to be_present
      expect(response).to redirect_to @exam
    end
  end
end
