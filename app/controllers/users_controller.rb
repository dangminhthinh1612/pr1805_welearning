class UsersController < ApplicationController

  def show
    @user = User.find_by :id, params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit :user_name, :email, :password,
                                 :password_confirmation
  end
end
