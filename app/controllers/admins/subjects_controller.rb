class Admins::SubjectsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    # implement later  
  end
  
  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.new subject_params
    if @subject.save
      redirect_to admins_subjects_path, success: "Successfully created subject!"
    else
      render "new"
    end
  end
  
  private
  def subject_params
    params.require(:subject).permit :name, :duration
  end
end
