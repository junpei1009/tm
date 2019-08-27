class Product < ApplicationRecord
  has_many :order_histories
  has_many :product_artists
  has_many :product_genres
  has_many :labels
  has_many :disks
  has_many :jaket
end
