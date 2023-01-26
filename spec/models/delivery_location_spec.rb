require 'rails_helper'

RSpec.describe DeliveryLocation, type: :model do
  before do
    @delivery_location = FactoryBot.build(:delivery_location)
end

describe '配送情報入力' do
  context '配送先情報が登録ができるとき'
    it '全ての入力事項が、存在すれば登録できる' do
      expect(@delivery_location).to be_valid
  end

  it '建物名は空でも登録できる' do
    @order_address.building_name = nil
    expect(@delivery_location).to be_valid
  end
end

context '情報が正しく入力されていないとき' do
  it '郵便番号が入力できていない' do
      @delivery_location.postal_code = nil
      @delivery_location.valid?
      expect(@delivery_location.errors.full_messages).to include("Postal code is invalid")
    end
    
    it '都道府県を選んでいない' do
      @delivery_location.shipper_id = 1
      @delivery_location.valid?
      expect(@delivery_location.errors.full_messages).to include("Postal code can't be blank")
    end

    it '市区町村が入力できていない' do
      @delivery_location.municipalities = nil
      @delivery_location.valid?
      expect(@delivery_location.errors.full_messages).to include("Shipper can't be blank")
    end

    it '番地が入力できていない' do
      @delivery_location.address = nil
      @delivery_location.valid?
      expect(@delivery_location.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号を入力できていない' do
      @delivery_location.telephone_number = nil
      @delivery_location.valid?
      expect(@delivery_location.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'user_idが空である' do
      @delivery_location.user_id = nil
      @delivery_location.valid?
      expect(@delivery_location.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空である' do
      @delivery_location.item_id = nil
      @delivery_location.valid?
      expect(@delivery_location.errors.full_messages).to include("Item can't be blank")
    end

    it '郵便番号はハイフンがないと登録できない' do
      @delivery_location.postal_code = 1234567
      @delivery_location.valid?
      expect(@delivery_location.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it "tokenが空では登録できない" do
      @order.token = nil
      @order.valid?
      expect(@delivery_location.errors.full_messages).to include("Token can't be blank")
    end
  end
end

