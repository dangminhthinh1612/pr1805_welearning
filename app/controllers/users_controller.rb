class UsersController < ApplicationController

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

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = "Xóa tài khoản thành công!"
    redirect_to admin_users_path
  end
  private

  def user_params
    params.require(:user).permit :user_name, :email, :password, :password_confirmation
  end
end
