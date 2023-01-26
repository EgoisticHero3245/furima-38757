require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @buy = FactoryBot.build(:buy)
end

describe '配送情報入力' do
  context '配送先情報が登録ができるとき'
    it '全ての入力事項が、存在すれば登録できる' do
      expect(@buy).to be_valid
  end

  it '建物名は空でも登録できる' do
    @buy.building_name = nil
    expect(@buy).to be_valid
  end
end

context '情報が正しく入力されていないとき' do
  it '郵便番号が入力できていない' do
      @buy.postal_code = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code is invalid")
    end
    
    it '都道府県を選んでいない' do
      @buy.shipper_id = 1
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code can't be blank")
    end

    it '市区町村が入力できていない' do
      @buy.municipalities = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Shipper can't be blank")
    end

    it '番地が入力できていない' do
      @buy.address = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号を入力できていない' do
      @buy.telephone_number = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'user_idが空である' do
      @buy.user_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空である' do
      @buy.item_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Item can't be blank")
    end

    it '郵便番号はハイフンがないと登録できない' do
      @buy.postal_code = 1234567
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it "tokenが空では登録できない" do
      @order.token = nil
      @order.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end
  end
end