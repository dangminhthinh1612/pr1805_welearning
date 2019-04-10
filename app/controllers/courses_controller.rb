class CoursesController < ApplicationController

  def index
   @courses = Course.paginate page: params[:page], per_page: 15
  end

  def show
    @course = Course.find_by id: params[:id]
  end

  def course_params
    params(:course).require.permit :name, :description, :price, :picture
  end
end
