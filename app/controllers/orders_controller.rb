class OrdersController < ApplicationController

def index
  @item = Item.find(params[:item_id])
  @order_shipping_address = OrderShippingAddress.new

end

def create
  
  @item = Item.find(params[:item_id])
  @order_shipping_address = OrderShippingAddress.new(order_params)

  if @order_shipping_address.valid?
    pay_item
    @order_shipping_address.save
    redirect_to root_path
  else
    render "index" 
  end
end


private

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
  Payjp::Charge.create(  
    card: order_params[:token],
    amount: @item.price,
    currency: 'jpy'                 
  )
end


  def order_params
    params.require(:order_shipping_address).permit( :postal_number, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end


end
