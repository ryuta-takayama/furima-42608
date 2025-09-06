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

   extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :item_condition
    belongs_to :shipping_fee_burden
    belongs_to :prefecture
    belongs_to :shipping_lead_time
    
end
