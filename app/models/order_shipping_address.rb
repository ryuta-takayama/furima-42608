class OrderShippingAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address_line
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
  end
 extend ActiveHash::Associations::ActiveRecordExtensions
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end