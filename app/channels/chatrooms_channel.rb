class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    if current_user.admin
      Chatroom.all.each do |chatroom|
        stream_from "chatroom:#{chatroom.id}"
      end
    else
      current_user.chatrooms.each do |chatroom|
        stream_from "chatroom:#{chatroom.id}"
      end
    end
  end

  def unsubscribed; end
end
