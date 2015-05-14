class ExaminationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @examinations = current_user.examinations
                    .order("created_at DESC")
                    .paginate page: params[:page], per_page: Settings.page_exam_size
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
      time_out = @examination.subject.duration.minute.from_now
      @examination.update_attributes status: "View", end_testing_at: time_out
    else
      if @examination.update_attributes examination_params
        end_at = @examination.end_testing_at.to_time
        start_testing_at = end_at - @examination.subject.duration.minutes
        last_submited_duration = Time.now.to_time - start_testing_at
        @examination.update_attribute :submited_duration, last_submited_duration
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
