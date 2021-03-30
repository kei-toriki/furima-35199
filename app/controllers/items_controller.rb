class ItemsController < ApplicationController
  before_action :authenticate_user! , only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to "#"
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :burden_id, :area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
