class User < ApplicationRecord
  has_many :user_courses, class_name: UserCourse.name
  has_many :courses, through: :user_courses
  has_secure_password
end
