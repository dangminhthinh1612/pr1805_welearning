class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :rate, presence: true
end
