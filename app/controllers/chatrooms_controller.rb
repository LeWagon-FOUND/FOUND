class ChatroomsController < ApplicationController
  def create
    if params[:chatroom][:item_id].present?
      chatroom_name = Item.find(params[:chatroom][:item_id]).name.to_s
      Chatroom.create!(name: chatroom_name, finder_user_id: current_user.id, user_id: params[:chatroom][:user_id])
    else
      chatroom_name = "#{current_user.first_name} and #{User.find(params[:chatroom][:user_id]).first_name}"
      Chatroom.create!(name: chatroom_name, finder_user_id: current_user.id, user_id: params[:chatroom][:user_id])
    end
    redirect_to chatrooms_path
  end

  def index
    @chatrooms = Chatroom.where(user_id: current_user).or(Chatroom.where(finder_user_id: current_user))
    @message = Message.new
  end

  def destroy
    Message.where(chatroom_id: params[:id]).destroy_all
    Chatroom.find(params[:id]).destroy
    redirect_to chatrooms_path
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:user, :item)
  end
end
