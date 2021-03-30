class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :burden_id, :area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
