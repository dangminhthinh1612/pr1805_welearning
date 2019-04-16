class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.build message_params
    @message.save!
    redirect_to messages_path
  end
  private

  def message_params
    params.require(:message).permit :content
  end
end
