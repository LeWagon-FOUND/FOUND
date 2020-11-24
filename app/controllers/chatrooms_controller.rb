class ChatroomsController < ApplicationController
  def create
    if params[:chatroom][:item_id].present?
      chatroom_name = Item.find(params[:chatroom][:item_id]).name.to_s
      Chatroom.create!(name: chatroom_name, finder_user_id: current_user.id, user_id: params[:chatroom][:user_id])
    else
      chatroom_name = "#{current_user.incomplete_name} - #{User.find(params[:chatroom][:user_id]).incomplete_name}"
      Chatroom.create!(name: chatroom_name, finder_user_id: current_user.id, user_id: params[:chatroom][:user_id])
    end
    redirect_to profile_path
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:user, :item)
  end
end
