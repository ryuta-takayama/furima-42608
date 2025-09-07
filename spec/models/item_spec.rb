require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
   @user = FactoryBot.create(:user)
   @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品出品' do
    context '商品出品ができるとき（正常系）' do
      it 'item_name、item_explain、category_id、item_condition_id、shipping_fee_burden_id、prefecture_id、shipping_lead_time_id、price、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字で、¥300以上¥9,999,999以下であれば登録できる' do
        @item.price = 5000
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき（異常系）' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_explainが空では登録できない' do
        @item.item_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explain can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_condition_idが1では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'shipping_fee_burden_idが1では登録できない' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_lead_time_idが1では登録できない' do
        @item.shipping_lead_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping lead time can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
      end
      it 'priceが¥9,999,999を超えると登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = '5000yen'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
      end
      it 'priceが半角英字では登録できない' do
        @item.price = 'five thousand'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image must be attached")
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      
    end


  end

end
