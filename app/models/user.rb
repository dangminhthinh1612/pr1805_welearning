class User < ApplicationRecord
  has_many :user_courses, class_name: UserCourse.name
  has_many :courses, through: :user_courses
  has_many :carts, class_name: Cart.name
  has_many :courses, through: :carts
  has_many :messages

  attr_accessor :remember_token, :activation_token, :reset_token

  before_create :create_activation_digest
  before_save { self.email = email.downcase }
  
  validates :user_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  mount_uploader :picture, PictureUploader
  validate  :picture_size

  scope :search, ->(term){where("user_name LIKE :u_term OR email LIKE :u_term",
    u_term: "%#{term}%")}

  class << self

    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def activate
    update_attribute :activated, true
    update_attribute :activated_at, Time.zone.now
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute :reset_digest,  User.digest(reset_token)
    update_attribute :reset_sent_at, Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def clear_reset_digest
    update_attribute :reset_digest, nil
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  # def self.search term
  #   return all unless term
  #     where("user_name LIKE :u_term OR email LIKE :u_term", u_term: "%#{term}%")
  # end

  private
  def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest activation_token
  end

  def picture_size
    errors.add(:picture, "should be less than 5MB") if picture.size > 5.megabytes
  end
end
