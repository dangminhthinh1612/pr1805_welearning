class Lesson < ApplicationRecord
  has_many :user_course_lessons, class_name: UserCourseLesson.name
  has_many :user_courses, through: :user_course_lessons
  has_many :excercises
  has_many :attachments
  belongs_to :course

  scope :ordered_by_title, -> { order lesson_title: :asc }

  validates :lesson_title, presence: true
  validates :lesson_content, presence: true
end
