class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:info] = "Logged in!"
      redirect_to root_url
    else
      flash[:info] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Logged out successfully!"
    redirect_to root_url
  end

end