class StaticPagesController < ApplicationController
  def home
    redirect_to examinations_path if user_signed_in?
    redirect_to admins_root_path if admin_signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end

  def news
  end
end
