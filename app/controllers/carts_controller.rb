class CartsController < ApplicationController

  def index
    @user_courses = current_user.user_courses.includes(:course).paginate page: params[:page]
  end

  def create
    @cart = current_user.carts.build
    if @cart.save
      flash[:success] = "Thanh toán thành công!"
      redirect_to courses_path
    else
      render :index
    end
  end
end
