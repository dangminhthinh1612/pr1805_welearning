class Excercise < ApplicationRecord
  has_many :questions
  belongs_to :lesson
end
