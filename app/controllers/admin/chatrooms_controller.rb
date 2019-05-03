class Admin::ChatroomsController < Admin::BaseController
  before_action :load_chat_room

  def index; end

  def new
    @chatroom = Chatroom.new
  end

  def show
    @messages = @chatroom.messages
  end

  private

  def chatroom_params
    params.require(:chatroom).permit :user_id, :name, :support
  end

  def load_chat_room
    @chatrooms = Chatroom.all.includes(:chatroom_users)
    @chatroom = Chatroom.find_by id: params[:id]
  end
end
