class ProductAritist < ApplicationRecord
  belongs_to :artist
  belongs_to :product
end
