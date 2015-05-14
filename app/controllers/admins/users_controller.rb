class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.paginate page: params[:page], per_page: Settings.page_size
  end
  
  def show
    @user = User.find params[:id]
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to admins_users_path, success: t(:delete_success, model: "user")
  end
end
