class Admins::SessionsController < Devise::SessionsController
  def new
    super  
  end
  
  def create
    user = User.find_by_email params[:admin][:email]
    if user && user.admin?
      super
    else
      error = I18n.t :not_found_in_database,
                     scope: [:devise, :failure],
                     authentication_keys: "email"
      flash[:alert] = error
      redirect_to new_admin_session_path
    end
  end 
end
