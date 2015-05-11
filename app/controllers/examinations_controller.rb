class ExaminationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @examinations = current_user.examinations
                    .order("created_at DESC")
                    .paginate page: params[:page], per_page: 5
  end
  
  def create
    @examination = current_user.examinations.create examination_params
    redirect_to examinations_path
  end

  def show
    @examination = Examination.find params[:id]
  end

  def update    
    @examination = Examination.find params[:id]
    if params[:status] == "Start"
      @examination.update_attribute :status, "View"
    else
      if @examination.update_attributes examination_params
        flash[:success] = t(:updated_success, model: "AnswerSheet")
      else
        flash[:danger] = t(:updated_failed, model: "AnswerSheet")
      end
    end
    redirect_to @examination
  end
  
  private
  def examination_params
    params.require(:examination)
          .permit :subject_id, :status,
                   answer_sheets_attributes: [:id, :option_id, :answer_content]
  end
end
