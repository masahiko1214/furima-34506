require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it '商品名、説明、商品のカテゴリー、商品状態、配送料の負担、配送元地域、配送までの日数、価格があれば出品出来る' do
        expect(@item).to be_valid
      end

      it '商品価格が半角数字であれば出品出来る' do
        @item.price = 33333
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品名が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end


      it 'ユーザーidが紐づいていなけれは登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end

      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category is not a number'
      end

      it 'カテゴリーにおいて1を選ぶと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end

      it '商品状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition is not a number'
      end

      it '商品状態において1を選ぶと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 1'
      end

      it '送料負担が空では登録できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Burden is not a number'
      end

      it '送料負担において1を選ぶと登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Burden must be other than 1'
      end

      it '配送元地域が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture is not a number'
      end

      it '配送元地域において1を選ぶと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
      end

      it '配送日数が空では登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Days to ship is not a number'
      end

      it '配送日数において1を選ぶと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Days to ship must be other than 1'
      end

      it '商品価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

     
      it '商品価格が全角数字では登録できない' do
        @item.price = '３３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is too short (minimum is 3 characters)','Price is not a number'
      end

      it '商品価格が全角文字では登録できない' do
        @item.price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is too short (minimum is 3 characters)','Price is not a number'
      end

      it '商品価格が半角英数混合では登録できない' do
        @item.price = '3m3m3m3m'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is too short (minimum is 3 characters)','Price is not a number'
      end

      it '商品価格が半角英語では登録できない' do
        @item.price = 'mmmmmmm'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is too short (minimum is 3 characters)','Price is not a number'
      end

      it '商品価格が299以下では登録できない' do
        @item.price = 22
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is too short (minimum is 3 characters)',
                                                      'Price must be greater than or equal to 300'
      end

      it '商品価格が10,000,000円以上では登録できない' do
        @item.price = 11111111
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end
    end
  end
end
