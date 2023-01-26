require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_form = FactoryBot.build(:buy_form, user_id: user.id, item_id: item.id)
    sleep 0.05
  end
  
  describe '配送情報入力' do
    context '配送先情報が登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@buy_form).to be_valid
      end
      
      it '建物名は空でも登録できる' do
        @buy_form.building_name = nil
        expect(@buy_form).to be_valid
      end
    end
    
    context '情報が正しく入力されていないとき' do
      it '郵便番号が入力できていない' do
        @buy_form.postal_code = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Postal code can't be blank")
      end
      
      it '都道府県を選んでいない' do
        @buy_form.shipper_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Shipper can't be blank")
      end
      
      it '市区町村が入力できていない' do
        @buy_form.municipalities = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Municipalities can't be blank")
      end
      
      it '番地が入力できていない' do
        @buy_form.address = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Address can't be blank")
      end
      
      it '電話番号を入力できていない' do
        @buy_form.telephone_number = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      
      it 'user_idが空である' do
        @buy_form.user_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("User can't be blank")
      end
      
      it 'item_idが空である' do
        @buy_form.item_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Item can't be blank")
      end
      
      it '郵便番号はハイフンがないと登録できない' do
        @buy_form.postal_code = 1234567
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Postal code is invalid")
      end
      
      it "tokenが空では登録できない" do
        @buy_form.token = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end