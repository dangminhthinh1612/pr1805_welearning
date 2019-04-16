class UserCoursesController < ApplicationController

  def create
    @user_course = current_user.user_courses.create course_id: params[:course_id]
    redirect_to courses_path
  end

  def destroy
    @user_course = UserCourse.find_by id: params[:id]
    @user_course.destroy
    redirect_to user_carts_path current_user
  end
end
