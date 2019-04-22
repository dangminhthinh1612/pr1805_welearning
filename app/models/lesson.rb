class Lesson < ApplicationRecord
  has_many :user_course_lessons
  has_many :user_courses, through: :user_course_lessons
  has_many :excercises, dependent: :destroy
  has_many :attachments, dependent: :destroy
  belongs_to :course
  has_many :contents, dependent: :destroy

  scope :ordered_by_title, -> { order lesson_title: :asc }

  validates :lesson_title, presence: true
  accepts_nested_attributes_for :contents,
    :reject_if => proc { |attributes| attributes[:text].blank? && attributes[:file_name].blank? },
    :allow_destroy => true
end
