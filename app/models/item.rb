class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_explain, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :shipping_fee_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_lead_time_id, presence: true
  validates :price, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_one_attached :image
end
