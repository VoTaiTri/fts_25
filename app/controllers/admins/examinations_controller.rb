class Admins::ExaminationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_examination, only: [:edit, :update]
  
  def index
    if params[:status]
      @examinations = Examination.have_status params[:status]
    else
      @examinations = Examination.all
    end
    @examinations = @examinations.paginate page: params[:page],
                                           per_page: Settings.page_size
  end
  
  def show
    user = User.find params[:user_id]
    @examination = user.examinations.find params[:id]
  end
  
  def edit
  end
  
  def update
    @examination.start_correction = true
    if @examination.update_attributes examination_params
      @examination.start_correction = false
      flash[:success] = t(:updated_success, model: "examination")
      redirect_to admins_examinations_path
    else
      flash[:danger] = t(:updated_failed, model: "examination")
      render "show"
    end
  end
  
  private
  def examination_params
    answer_sheets_attributes = [:id, :option_id, :answer_content, :correct]
    params.require(:examination)
          .permit :subject_id, :status,
                   answer_sheets_attributes: answer_sheets_attributes
  end
  
  def set_examination
    @examination = Examination.find params[:id]
  end
end
