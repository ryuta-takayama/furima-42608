class ShippingAddress < ApplicationRecord


  validates :postal_code, presence: :true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, presence: :true
  validates :city, presence: :true
  validates :address_line, presence: :true
  validates :phone_number, presence: :true, format: {with: /\A\d{10,11}\z/}

  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
 
end
