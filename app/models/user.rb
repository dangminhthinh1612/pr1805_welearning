class User < ApplicationRecord
  has_many :user_courses, class_name: UserCourse.name
  has_many :courses, through: :user_courses
  has_secure_password
  before_save { self.email = email.downcase }
  validates :user_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  has_many :user_courses, class_name: UserCourse.name
  has_many :courses, through: :user_courses
end
