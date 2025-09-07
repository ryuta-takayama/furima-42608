FactoryBot.define do
  factory :item do
    item_name              { "テスト商品" }
    item_explain            { "説明テキスト" }
    category_id            { 2 }  
    item_condition_id      { 2 }
    shipping_fee_burden_id { 2 }
    prefecture_id          { 2 }
    shipping_lead_time_id  { 2 }
    price                  { 1000 }

    association :user

    after(:build) do |item|
     item.image.attach( io: File.open('public/images/test_image.png'), filename: 'sample.png' )
    end
  end
end