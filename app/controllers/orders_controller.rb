class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_item, only: [:index, :create]
   
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
    @order = Order.new
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:postal_code, :area_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end 
  end

end
