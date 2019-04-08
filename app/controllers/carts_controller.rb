class CartsController < ApplicationController

  def index
    @carts = current_user.carts.paginate page: params[:page]
  end

  def create
    @cart = current_user.carts.create course_id: params[:course_id]
    redirect_to courses_path
  end

  def destroy
    @cart = Cart.find_by course_id: params[:id]
    @cart.destroy
    redirect_to user_carts_path
  end
end
