class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
    validates :user
    validates :image
    validates :price, length: { minimum: 3, maxinum: 7 }, numericality: { only_integer: true,
                                                                          greater_than_or_equal_to: 300, less_than: 10_000_000 } do
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
  has_one    :order
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


  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end
