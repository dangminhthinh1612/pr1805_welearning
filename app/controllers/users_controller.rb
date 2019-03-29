class UsersController < ApplicationController
  before_action :logged_in_user, :correct_user, only: [:edit, :update]

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:success] = "We have sent an activation mail to \"#{@user.email}\",
                          please check and activate before login!"
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def edit
    @user = User.find_by id: params[:id]
  end

  private

  def user_params
    params.require(:user).permit :user_name, :email, :password,
      :password_confirmation, :picture, :phone_number, :id_card
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless current_user?(@user)
  end
end
