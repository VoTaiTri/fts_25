class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.paginate page: params[:page], per_page: Settings.page_size
  end
  
  def show
    @user = User.find params[:id]
  end
end
