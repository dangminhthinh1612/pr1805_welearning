class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :user_courses, class_name: UserCourse.name
  has_many :users, through: :user_courses

  belongs_to :category

  mount_uploader :picture, PictureUploader
  validate  :picture_size
  validates :name, presence: true, length: { maximum: 255 },
    uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true

  scope :popular, -> {order buy_times: :desc}
  scope :newest, -> {order updated_at: :desc}
  scope :by_title, -> (title){ where("(courses.name) LIKE :search", search: "%#{title}%")}
  scope :by_category_ids, -> (category_ids) do
    joins(:category).where "category_id IN (?)", category_ids
  end
  scope :by_price_lt, -> (price_lt){ where("(courses.price) <= ?", price_lt)}
  scope :by_price_gt, -> (price_gt){ where("(courses.price) >= ?", price_gt)}

  def picture_size
    errors.add(:picture, "should be less than 5MB") if picture.size > 5.megabytes
  end

  def increase_buy_times
    update buy_times: (buy_times + 1)
  end

  def added_cart? user
    users.ids.include? (user.id)
  end

  def paid_course? user
    user_courses.unpaid.pluck(:user_id).include? (user.id)
  end
end
