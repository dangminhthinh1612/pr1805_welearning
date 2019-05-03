class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true

  after_save :send_messages

  private

  def send_messages
    ActionCable.server.broadcast "chatroom:#{chatroom_id}",
      content: content,
      username: user.user_name,
      chatroom_id: chatroom.id
  end
end
