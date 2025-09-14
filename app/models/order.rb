class Order < ApplicationRecord

  belong_to :user
  belong_to :item
  has_one :shipping_address, dependent: :destroy
end
