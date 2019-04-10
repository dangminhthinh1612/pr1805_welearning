class Admin::CoursesController < Admin::BaseController

  before_action :current_course, only: [:destroy, :show, :edit, :update]
  before_action :load_category_options

  def index
    @courses = Course.paginate page: params[:page], per_page: 15
  end

  def show
    @lessons = @course.lessons.ordered_by_title.paginate page: params[:page], per_page: 15
  end

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

  def edit; end

  def update
    if @course.update_attributes course_params
      flash[:success] = "Cập nhật khóa học thành công!"
      redirect_to admin_course_path @course
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:danger] = "Xóa khóa học thành công!"
    redirect_to admin_courses_path
  end

  private
  def course_params
    params.require(:course).permit :name, :price, :description, :rate,
      :buy_time, :category_id, :picture
  end

  def current_course
    @course = Course.find_by id: params[:id]
  end

  def load_category_options
    @category_options = Category.pluck :tag, :id
  end

end
