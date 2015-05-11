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
  
  private
  def examination_params
    params.require(:examination).permit :subject_id
  end
end
