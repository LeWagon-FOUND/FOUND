class ChatroomsController < ApplicationController
 # skip_before_action :authenticate_user!, only: [:new]
  def new

  end

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
