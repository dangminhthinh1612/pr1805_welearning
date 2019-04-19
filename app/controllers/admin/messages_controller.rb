class Admin::MessagesController < Admin::BaseController
  after_create :send_messages

  def new
    @message = current_user.messages.build
  end

  def create
    @chatroom = Chatroom.find_by id: params[:chatroom_id]
    @message = @chatroom.messages.build message_params
    @message.save
  end

  private
  def message_params
    params.require(:message).permit :content, :chatroom_id, :user_id
  end
end
