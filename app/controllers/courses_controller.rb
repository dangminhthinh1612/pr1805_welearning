class CoursesController < ApplicationController

  def index
   @courses = Course.paginate page: params[:page], per_page: 15
  end

  def show
    @course = Course.find_by id: params[:id]
    if @course
      @reviews = @course.reviews.paginate page: params[:page], per_page: 5
      @avg_review = @course.avg_rate
      @lessons = @course.lessons.paginate page: params[:page], per_page: 15
    else
      redirect_to root_path
    end
  end

  private

  def course_params
    params(:course).require.permit :name, :description, :price, :picture
  end
end
