class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :user_courses, class_name: UserCourse.name
  has_many :users, through: :user_courses
  belongs_to :category
  scope :popular, -> {order buy_times: :desc}
  scope :newest, -> {order updated_at: :desc}
  mount_uploader :picture, PictureUploader
  validate  :picture_size

  validates :name, presence: true, length: { maximum: 255 },
    uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true

  scope :by_title, -> (title){ where("(courses.name) LIKE :search", search: "%#{title}%")}
  scope :by_category_ids, -> (category_ids) do
    joins(:category).where "category_id IN (?)", category_ids
  end

  def picture_size
    errors.add(:picture, "should be less than 5MB") if picture.size > 5.megabytes
  end
end
