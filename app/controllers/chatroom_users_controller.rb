class ChatroomUsersController < ApplicationController

  def create
    @chatroom = Chatroom.find_by id: params[:chatroom_id]
    @chatroom_user = current_user.chatroom_users.create chatroom_id: params[:chatroom_id]
    redirect_to chatrooms_path
  end

  def destroy
    @chatroom_user = ChatroomUser.find_by id: params[:id]
    @chatroom_user.destroy
    redirect_to chatrooms_path
  end
end
