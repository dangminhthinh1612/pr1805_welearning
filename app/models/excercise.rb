class Excercise < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, :through => :questions
  belongs_to :lesson
  accepts_nested_attributes_for :questions,
    :reject_if => proc { |attributes| attributes[:question_content].blank? },
    :allow_destroy => true, limit: 30

  scope :ordered_by_name, -> { order excercise_name: :asc }

  validates :excercise_name, presence: true
end