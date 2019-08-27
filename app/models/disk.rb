class Disk < ApplicationRecord
  belongs_to :product
  has_many :sings
end
