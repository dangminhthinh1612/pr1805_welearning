class Admin::ExcercisesController < Admin::BaseController
  before_action :load_excercise, only: [:show, :edit, :destroy, :update]
  before_action :load_lesson, only: [:create, :new, :show, :edit, :destroy]
  before_action :load_question, only: [:create, :new, :show, :edit, :destroy]
  before_action :load_answer, only: [:create, :new, :show, :edit, :destroy]

  def index;  end

  def show
    @questions = @excercise.questions.ordered_by_content.paginate page: params[:page], per_page: 15
  end

  def new
    @excercise = @lesson.excercises.build
    @question = @excercise.questions.build
    @answer = @question.answers.build
  end

  def create
    @excercise = @lesson.excercises.build excercise_params
    if @excercise.save
      flash[:success] = "Tạo bài tập thành công!"
      redirect_to admin_sname_lesson_path @lesson
    else
      flash[:danger] = "Bạn chưa điền đầy đủ thông tin bài tập"
      render :new
    end
  end

  def edit; end

  def update
    @lesson = @excercise.lesson
    if @excercise.update_attributes excercise_update_params
      flash[:success] = "Cập nhật bài tập thành công!"
      redirect_to admin_sname_lesson_path @lesson
    else
      flash[:danger] = "Bạn chưa điền đầy đủ thông tin bài tập"
      render :edit
    end
  end

  def destroy
    @excercise.destroy
    flash[:danger] = "Xóa bài tập thành công!"
    redirect_to admin_lesson_path @excercise.lesson
  end

  private
  def excercise_params
    params.require(:excercise).permit(:excercise_name, :id, questions_attributes:
      [:id,:question_content, :_destroy, answers_attributes:
        [:id, :answer_content, :is_correct, :_destroy]])
  end

  def excercise_update_params
    params.require(:excercise).permit(:excercise_name, :id, questions_attributes:
      [:id,:question_content, :_destroy, answers_attributes:
        [:id, :answer_content, :is_correct, :_destroy]])
  end

  def load_lesson
    @lesson = Lesson.find_by id: params[:lesson_id]
  end

  def load_excercise
    @excercise = Excercise.find_by id: params[:id]
  end

  def load_question
    @question = Question.find_by id: params[:question_id]
  end

  def load_answer
    @answer = Answer.find_by id: params[:answer_id]
  end
 end