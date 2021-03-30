require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規登録がうまくいくとき' do
      it 'item_name,explanation,image,category_id,status_id,burden_id,area_id,shipping_day_id,priceがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが1では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'burden_idが1では登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it 'area_idが1では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it 'shipping_day_idが1では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは全角文字では登録できない' do
        @item.price = 'ああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは半角文字では登録できない' do
        @item.price = 'aa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは全角数字では登録できない' do
        @item.price = '４４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは300円以下では登録できない' do
        @item.price = 22
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceは9999999円以上では登録できない' do
        @item.price = 111111111
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
