class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:emal])
    if @user.user_authenticate(params[:password])
      session[:user_id] = @user.user_id
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
