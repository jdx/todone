class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/tasks" # or tasks_path
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone_number, :email, :password, :password_confirmation)
  end

end