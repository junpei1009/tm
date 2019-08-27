class ProductGenre < ApplicationRecord
  belongs_to :production
  belongs_to :genre
end
