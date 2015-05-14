class Admins::ExaminationsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @user = User.find params[:user_id]
    @examination = @user.examinations.find params[:id]
  end
end
