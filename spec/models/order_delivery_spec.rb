require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
      sleep(0.2)
    end
  
    describe '商品購入情報の保存' do
      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_delivery).to be_valid
        end
      end

      context '内容に問題がある場合' do
        it 'postal_codeが空だと保存できないこと' do
          @order_delivery.postal_code = ''
          @order_delivery.valid?
          expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @order_delivery.postal_code = '0000000'
          @order_delivery.valid?
          expect(@order_delivery.errors.full_messages).to include("Postal code is invalid")
        end
        it 'municipalitiesが空だと保存できないこと' do
          @order_delivery.municipalities = ''
          @order_delivery.valid?
          expect(@order_delivery.errors.full_messages).to include("Municipalities can't be blank")
        end
        it 'area_idが1だと保存できないこと' do
          @order_delivery.area_id = 1
          @order_delivery.valid?
          expect(@order_delivery.errors.full_messages).to include("Area must be other than 1")
        end
        it 'addressが空では保存できないこと' do
          @order_delivery.postal_code = ''
          @order_delivery.valid?
          expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'phone_numberは空は保存できないこと' do
          @order_delivery.phone_number = ''
          @order_delivery.valid?
          expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_number11桁以上では保存できないこと' do
          @order_delivery.phone_number = '111111111111'
          @order_delivery.valid?
          expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
        end
        it 'buildingは空でも保存できること' do
          @order_delivery.building = ''
          expect(@order_delivery).to be_valid
        end
        it 'tekenが空だと保存できないこと' do
          @order_delivery.token = nil
          @order_delivery.valid?
          expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
end
