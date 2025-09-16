require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入ができるとき（正常系）' do
      it 'postal_code、prefecture_id、city、address_line、phone_number、user_id、item_id、tokenが存在すれば登録できる' do
        expect(@order_shipping_address).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @order_shipping_address.building_name = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '商品購入ができないとき（異常系）' do
      it 'postal_codeが空では登録できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
    end
  end

end
