class ItemsController < ApplicationController
  before_action :item_select, only: %i[show edit destroy update]

  def index
    @user = User.find(params[:profile_id])
    @items = Item.where(user_id: params[:profile_id])
  end

  def show; end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create!(set_params)
    if @item.save
      redirect_to user_profile_item_path(@item)
    else
      render :new
    end
  end

  def edit; end

  def update
    @item.update(set_params)
    redirect_to user_profile_item_path(@item)
  end

  def destroy
    @item.destroy
    redirect_to cocktails_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :message, :notification, :photo)
  end

  def item_select
    @item = Item.find(params[:id])
  end
end
