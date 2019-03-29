class Course < ApplicationRecord
  has_many :lessons
  has_many :user_courses, class_name: UserCourse.name
  has_many :users, through: :user_courses

  belongs_to :category

end
