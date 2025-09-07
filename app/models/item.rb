class Item < ApplicationRecord

  validates :item_name, presence: true
  validates :item_explain, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :shipping_fee_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_lead_time_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "must be between ¥300 and ¥9,999,999" }

  belongs_to :user
  has_one_attached :image
  validate :image_must_be_attached

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_lead_time
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_lead_time_id, numericality: { other_than: 1, message: "can't be blank" }

  private
  def image_must_be_attached
    errors.add(:image, "must be attached") unless image.attached?
  end


end
