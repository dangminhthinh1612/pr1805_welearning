class UserCoursesController < ApplicationController
  before_action :logged_in_user

  def create
    @user_course = current_user.user_courses.create course_id: params[:course_id]
    respond_to do |format|
      format.html{ redirect_to courses_path}
      format.js
    end
  end

  def destroy
    @user_course = UserCourse.find_by id: params[:id]
    @user_course.destroy
    redirect_to user_carts_path current_user
  end
end
