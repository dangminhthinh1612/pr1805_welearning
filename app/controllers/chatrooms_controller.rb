class ChatroomsController < ApplicationController
  before_action :logged_in_user
  before_action :get_chatroom
  before_action :verify_access, only: :show

  def index; end

  def new
    @chatroom = Chatroom.new
  end

  def show
    @messages = @chatroom.messages
  end

  def create
    @chatroom = Chatroom.new chatroom_params
    if @chatroom.save
      redirect_to chatrooms_path
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit :name, :user_id, :support
  end

  def get_chatroom
    @chatrooms = Chatroom.all.includes(:chatroom_users)
    @chatroom = Chatroom.find_by id: params[:id]
  end

  def verify_access
    if @chatroom.nil?
      flash[:danger] = "Bạn không thể truy cập phòng chat này!"
      redirect_to chatrooms_path
    else
      unless @chatroom.check_room current_user
        flash[:warning] = "Bạn đã kết nối với phòng chat chưa?"
        redirect_to chatrooms_path
      end
    end
  end
end
