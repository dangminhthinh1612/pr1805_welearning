class Admin::LessonsController < Admin::BaseController

  before_action :load_lesson, only: [:show, :edit, :destroy]
  before_action :load_course, only: [:new, :create, :destroy]

  def show; end

  def new
    @lesson = @course.lessons.build
  end

  def create
    @lesson = @course.lessons.build lesson_params
    if @lesson.save
      flash[:success] = "Tạo bài giảng thành công!"
      redirect_to admin_course_path @course
    else
      render :new
    end
  end

  def edit; end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = "Cập nhật bài giảng thành công!"
      redirect_to admin_course_path @course
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    flash[:danger] = "Xóa bài giảng thành công!"
    redirect_to admin_course_path @lesson.course
  end

  private
  def lesson_params
    params.require(:lesson).permit :lesson_title, :lesson_status,
      :lesson_content
  end

  def load_course
    @course = Course.find_by id: params[:course_id]
  end

  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
  end
end
