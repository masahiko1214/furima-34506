class OrdersController < ApplicationController

def index
  @item = Item.find(params[:item_id])
  @order_shipping_address = OrderShippingAddress.new

end

def create
  binding.pry
  @item = Item.find(params[:item_id])
  @order_shipping_address = OrderShippingAddress.new(order_params)
  
  if @order_shipping_address.valid?
    @order_shipping_address.save
    redirect_to root_path
  else
    render "index" 
  end
end


private

  def order_params
    params.require(:order_shipping_address).permit( :postal_number, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end


end
