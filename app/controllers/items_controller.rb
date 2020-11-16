class ItemsController < ApplicationController
  before_action :item_select, only: %i[show edit destroy]

  def index
    @items = Item.where(user_id: current_user.id)
  end

  def show; end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save!
      redirect_to user_items_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @item = Item.find(params[:format])            ### ???????????????????????
    @item.update(item_params)
    redirect_to user_items_path
  end

  def destroy
    @item.destroy
    redirect_to user_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :message, :notification, :photo, :user)
  end

  def item_select
    @item = Item.find(params[:id])
  end
end
