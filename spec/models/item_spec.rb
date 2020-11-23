require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいく時' do
      it '必要事項が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  
    context '商品の出品がうまくいかない時' do
      it "imageが空だと登録出来ない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "nameが空だと登録出来ない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "descriptionが空だと登録出来ない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it "categoryを選択しないと登録出来ない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category Select"
      end
      it "conditionを選択しないと登録出来ない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition Select"
      end
      it "feeを選択しないと登録出来ない" do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee Select"
      end
      it "prefectureを選択しないと登録出来ない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture Select"
      end
      it "dayを選択しないと登録出来ない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day Select"
      end
      it "priceが空だと登録出来ない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "priceが299円以下だと登録出来ない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it "priceが10000000円以上だと登録出来ない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it "priceが半角数字以外だと登録出来ない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Half-width number"
      end
    end
  end
end
