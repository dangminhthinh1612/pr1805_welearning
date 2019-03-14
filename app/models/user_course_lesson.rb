class UserCourseLesson < ApplicationRecord
  belongs_to :user_course, class_name: UserCourse.name
  belongs_to :lesson, class_name: Lesson.name
end
