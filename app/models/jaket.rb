class Jaket < ApplicationRecord
  belongs_to :product
  attachment :image
end
