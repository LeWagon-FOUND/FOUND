class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home public item]
  before_action :set_user, only: %i[dashboard generate]

  def home
    redirect_to user_items_path if user_signed_in?
  end

  def public
    @user = User.find(params[:id])
    @chatroom = Chatroom.new
    @finder = User.new
  end

  def item
    @item = Item.find(params[:id])
    @user = @item.user
    @chatroom = Chatroom.new
    @finder = User.new
  end

  private

  def set_user
    @user = current_user
  end

  def chatroom_params
    params.require(:chatroom).permit(:user)
  end
end
