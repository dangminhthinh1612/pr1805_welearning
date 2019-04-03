class CoursesController < ApplicationController

  def index
   @courses = Course.paginate page: params[:page], per_page: 15
  end

  def show
    @course = Course.find_by id: params[:id]
  end
end