class Admin::CoursesController < Admin::BaseController

  before_action :find_course, only: [:show, :destroy]

  def index
    @courses = Course.paginate page: params[:page]
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = "Tạo khóa học thành công!"
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def destroy
    @course.destroy
    flash.now[:success] = "Xóa khóa học thành công!"
    redirect_to admin_courses_path
  end

  private
  def course_params
    params.require(:course).permit :name, :price, :description, :rate,
      :buy_time, :category_id
  end
end
