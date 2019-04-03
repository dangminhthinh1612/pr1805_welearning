class Admin::UsersController < Admin::BaseController

  def index
    @users = User.paginate page: params[:page], per_page: 5
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.admin
      @user.update_attribute :admin, false
      respond_to do |format|
        format.html{ redirect_to @user}
        format.js
      end
    else
      @user.update_attribute :admin, true
      respond_to do |format|
        format.html{ redirect_to @user}
        format.js
      end
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:danger] = "Xóa tài khoản thành công!"
    redirect_to admin_users_path
  end
end
