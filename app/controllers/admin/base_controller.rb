class Admin::BaseController < ActionController::Base

  include SessionsHelper
  layout "admin"

  before_action :verify_admin

  private

  def verify_admin
    if !logged_in?
      flash[:danger] = "Đăng nhập để truy cập tính năng"
      redirect_to login_path
    elsif !current_user.admin
      flash[:warning] = "Bạn không thể truy cập tính năng này"
      redirect_to root_path
    end
  end
end
