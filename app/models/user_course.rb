class UserCourse < ApplicationRecord
  has_many :user_course_lessons
  has_many :lessons, through: :user_course_lessons
  belongs_to :user
  belongs_to :course

  scope :unpaid, -> { where cart_id:nil }
  scope :had_review, -> (u_user){ where cart_id: nil , user_id: u_user}
  def in_cart?
    cart_id.nil?
  end
end
