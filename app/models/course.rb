class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :user_courses, class_name: UserCourse.name
  has_many :users, through: :user_courses

  belongs_to :category

  validates :name, presence: true, length: { maximum: 255 },
    uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true

  scope :by_title, -> (title){ where("(courses.name) LIKE :search", search: "%#{title}%")}
  scope :by_category_ids, -> (category_ids) do
    joins(:category).where "category_id IN (?)", category_ids
  end
end
