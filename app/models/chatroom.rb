class Chatroom < ApplicationRecord
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :messages

  validates :name, presence: true

  scope :admin_support, -> { where support: false }

  def check_room user
    users.include?(user)
  end

  def chatroom_user user
    users.ids
  end
end
