class Disk < ApplicationRecord
  belongs_to :product
  has_many :sings

  accepts_nested_attributes_for :sings, reject_if: :all_blank, allow_destroy: true

  validates :disk_name, presence: true
end
