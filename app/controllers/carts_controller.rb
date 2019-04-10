class CartsController < ApplicationController

  before_action :current_cart
  before_action :course_unpaid, only: :update

  def index
    @carts = @current_cart.paginate page: params[:page]
  end

  def create
    @cart = @current_cart.create course_id: params[:course_id]
    redirect_to courses_path
  end

  def update
    @course_unpaid.update_all(paid: true)
    flash[:success] = "Thanh toán thành công!"
    redirect_to root_path
  end

  def destroy
    @cart = Cart.find_by course_id: params[:id]
    @cart.destroy
    redirect_to user_carts_path
  end

  private

  def course_unpaid
    @course_unpaid = current_user.carts.where(paid: false)
  end

  def current_cart
    @current_cart = current_user.carts
  end
end
