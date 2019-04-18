class ReviewsController < ApplicationController

  def new
    @review = current_user.reviews.build
  end
  def create
    @course = Course.find_by id: params[:course_id]
    @review = @course.reviews.build review_params
    if @review.save
      flash[:success] = "Cảm ơn đánh giá của bạn!"
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit :rate, :comment, :user_id, :course_id
  end
end
