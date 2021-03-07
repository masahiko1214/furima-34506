class OrdersController < ApplicationController

def index
  @item = Item.find(params[:item_id])
  @order_shipping_address = OrderShippingAddress.new

end

def create
  binding.pry

end


end
