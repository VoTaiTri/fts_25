require "rails_helper"

RSpec.describe "route for Question", type: :routing do

  it "routes admin_question_path to questions controller and shown action" do
    @question = FactoryGirl.create :question
     expect(get: admins_question_path(@question)).
       to route_to controller: "admins/questions", action: "show", id: "#{@question.id}"
  end

  it "routes admins_questions_path to questions controller and index action" do
     expect(get: admins_questions_path).
       to route_to controller: "admins/questions", action: "index"
  end

  it "routes new_admins_question_path to questions controller and new action" do
     expect(get: new_admins_question_path).
       to route_to controller: "admins/questions", action: "new"
  end

  it "routes admins_question_path to questions controller and create action" do
     expect(post: admins_questions_path).
       to route_to controller: "admins/questions", action: "create"
  end

  it "routes admin_question_path to questions controller and edit action" do
    @question = FactoryGirl.create :question
     expect(get: edit_admins_question_path(@question)).
       to route_to controller: "admins/questions", action: "edit", id: "#{@question.id}"
  end

  it "routes admins_questions_path to questions controller and update action" do
    @question = FactoryGirl.create :question
     expect(patch: admins_question_path(@question)).
       to route_to controller: "admins/questions", action: "update", id: "#{@question.id}"
  end
  it "routes admin_question_path to questions controller and destroy action" do
    @question = FactoryGirl.create :question
     expect(delete: admins_question_path(@question)).
       to route_to controller: "admins/questions", action: "destroy", id: "#{@question.id}"
  end
end
