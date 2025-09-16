class OrderShippingAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address_line
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end
 extend ActiveHash::Associations::ActiveRecordExtensions
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, order_id: order.id)

  end
end