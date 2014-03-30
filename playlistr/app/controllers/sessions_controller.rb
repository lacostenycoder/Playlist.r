class SessionsController < ApplicationController

  def new
     redirect_to root if current_user
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to root_url, :notice => "Logged in!"
    else
      flash[:notice] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    if session[:user_id] == nil
      flash[:notice] = "You are not logged in"
    else
      session[:user_id] = nil
      flash[:notice] = "You have successfully logged out."
    end
    redirect_to root_path
  end

end
