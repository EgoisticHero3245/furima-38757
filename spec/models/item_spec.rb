require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品の出品登録' do
  context '出品登録ができるとき'
    it '全ての入力事項が、存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  
  context '出品ができないとき' do
    it 'ユーザー登録している人でないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it '１枚画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空欄だと出品できない' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it '商品の説明が空欄だと出品できない' do
      @item.explanation_text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation text can't be blank")
    end
    it 'カテゴリーの情報が「---」だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーの情報が空欄だと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態の情報が「---」だと出品できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it '商品の状態の情報が空欄だと出品できない' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it '配送料の負担の情報が「---」だと出品できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it '配送料の負担の情報が空欄だと出品できない' do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it '発送元の地域の情報が「---」だと出品できない' do
      @item.shipper_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipper can't be blank")
    end
    it '発送元の地域の情報が空欄だと出品できない' do
      @item.shipper_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipper can't be blank")
    end
    it '発送までの日数の情報が「---」だと出品できない' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it '発送までの日数の情報が空欄だと出品できない' do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it '価格が空欄だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
    end
    it '価格の範囲が、300円未満だと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が、9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '価格が半角数字以外だと保存できない' do
      @item.price = "AAAAA"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
