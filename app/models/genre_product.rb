class GenreProduct < ApplicationRecord
  belongs_to :product
  belongs_to :genre
  accepts_nested_attributes_for :genre, reject_if: :all_blank, allow_destroy: true
end
