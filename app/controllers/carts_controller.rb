class CartsController < ApplicationController
  before_action :logged_in_user

  def index
    @carts = current_user.carts
    @user_courses = current_user.user_courses.includes(:course).paginate page: params[:page]
  end

  def show
    @cart = Cart.find_by id: params[:id]
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
