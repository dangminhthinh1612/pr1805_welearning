class Cart < ApplicationRecord
  belongs_to :user, class_name: User.name
  has_many :user_courses
  has_many :courses, through: :user_courses

  after_save :update_user_course

  private

  def update_user_course
    user.user_courses.unpaid.map(&:course).each{|course|
      course.increase_buy_times
    }
    user.user_courses.unpaid.update_all(cart_id: "#{id}")
  end
end
