class Admins::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_question, except: [:index, :new, :create]
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new question_params
    if @question.save
      redirect_to admins_questions_path, success: t(:created_success, model: "question")
    else
      render "new"
    end
  end
  
  private
  def set_question
    @question = Question.find params[:id]
  end
  
  def question_params
    params.require(:question)
          .permit :subject_id, :description, options_attributes: [:description, :correct]
  end
end
