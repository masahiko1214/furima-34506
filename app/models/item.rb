class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :explanation
    validates :user
    
    with_options format: { with: /\A[0-9]+\z/ },length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
      greater_than_or_equal_to: 300, less_than: 10000000} do
    validates :price
    end
     

  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :prefecture_id
    validates :days_to_ship_id

  end


  



  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days_to_ship




  
end
