class UserCourse < ApplicationRecord
  has_many :user_course_lessons, class_name: UserCourseLesson.name
  has_many :lessons, through: :user_course_lessons
  belongs_to :user, class_name: User.name
  belongs_to :course, class_name: Course.name
end
