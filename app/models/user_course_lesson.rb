class UserCourseLesson < ApplicationRecord
  belongs_to :user_course
  belongs_to :lesson
end
