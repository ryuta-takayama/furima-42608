class ShippingAddress < ApplicationRecord

  validates :postal_code, presence: :true
  validates :prefecture_id, presence: :true
  validates :city, presence: :true
  validates :address_line, presence: :true
  validates :phone_number, presence: :true

  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
 
end
