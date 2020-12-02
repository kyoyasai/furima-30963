require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context '新規登録がうまくいくとき' do
      it '必要事項が全て存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'postcodeが空だと保存できないこと' do
        @purchase_address.postcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postcode can't be blank"
      end
      it 'postcodeにハイフンがないと保存できないこと' do
        @purchase_address.postcode = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Postcode Input correctly'
      end
      it '都道府県を選択しないと保存できないこと(prefecture_id)' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Prefecture Select'
      end
      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空だと保存できないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが英数字のみでないと保存できないこと' do
        @purchase_address.phone_number = '000-111-222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number Input only number (Within 11 digits)'
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @purchase_address.phone_number = '000111122222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number Input only number (Within 11 digits)'
      end
      it 'tokenが空では保存できないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
