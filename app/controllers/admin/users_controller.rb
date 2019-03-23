class Admin::UsersController < Admin::BaseController

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash.now[:success] = "Xóa tài khoản thành công!"
    redirect_to admin_users_path
  end
end
