FactoryBot.define do
  factory :order_shipping_address do
    postal_number { '123-4567' }
    prefecture_id { 2 }
    municipality { '柳川市' }
    address { '1-1' }
    building_name { 'ハイツ' }
    phone_number { '08012345678' }

  end
end
