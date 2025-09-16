FactoryBot.define do
  factory :order_shipping_address do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'横浜市'}
    address_line {'若葉台1-1-1'}
    building_name {'若葉マンション101'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
