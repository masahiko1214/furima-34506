class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_number, :prefecture_id, :municipality, :address, :building_name, :phone_number
  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :price
    validates :postal_number,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
    validates :phone_number,  format: {with: /\A\d{11}\z/}
  end
  validates :prefecture_id, numericality: { other_than: 1 } 


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    shipping_address = ShippingAddress.create(postal_number: postal_number, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end