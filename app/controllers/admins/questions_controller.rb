class Admins::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_question, except: [:index, :new, :create]
  
  def index
    @questions = Question.paginate page: params[:page], per_page: Settings.page_size
  end
  
  def show
  end
  
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
  
  def edit
  end
  
  def update
    if @question.update_attributes question_params
      redirect_to  admins_questions_path, success: t(:updated_success, model: "question")
    else
      render "edit"
    end
  end
  
  def destroy
    @question.destroy
    redirect_to admins_questions_path, success: t(:delete_success, model: "question")
  end
  
  private
  def set_question
    @question = Question.find params[:id]
  end
  
  def question_params
    params.require(:question)
          .permit :subject_id, :description,
                  options_attributes: [:id, :description, :correct, :_destroy]
  end
end
