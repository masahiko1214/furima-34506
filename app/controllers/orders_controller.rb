class OrdersController < ApplicationController
  before_action :set_item_id, only: [:index, :create]
  before_action :move_to_index_or_sign_in, only: [:index, :create]

  def index
    @order_shipping_address = OrderShippingAddress.new

    redirect_to root_path if @item.order.present? # 購入されていたら直接URLを入力されてもトップページに返す機能です
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)

    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def move_to_index_or_sign_in
    unless user_signed_in? && current_user.id != @item.user.id      #  ログインしていない方や出品者は直接URLを入力されても前者はログインページに、後者はトップページに返す機能です
      redirect_to new_user_session_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      card: order_params[:token],
      amount: @item.price,
      currency: 'jpy'
    )
  end

  def order_params
    params.require(:order_shipping_address).permit(:postal_number, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end
