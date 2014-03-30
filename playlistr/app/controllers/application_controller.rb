class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return nil
    end
  end

  def user_authenticate
    if current_user == nil
      redirect_to login_path
    end
  end

  ###  implement admin functions later (make users admins, playlists etc.)
  def user_is_admin
    chech_admin = User.find(session[:user_id])
    if check_admin.admin == 'true'
      return
    else
      flash[:notice] = "Not Authorized, must be admin."
    end
  end

end
