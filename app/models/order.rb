class Order < ApplicationRecord

  has_many :order_histories
  belongs_to :customer

  accepts_nested_attributes_for :order_histories

end
