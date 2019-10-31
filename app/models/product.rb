class Product < ApplicationRecord

  has_many :order_histories
  has_many :artist_products
  has_many :artists, through: :artist_products
  has_many :genre_products
  has_many :genres, through: :genre_products
  has_many :labels
  has_many :disks
  has_many :jakets
  has_many :carts
  has_many :customers, through: :carts

  accepts_nested_attributes_for :artist_products, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :genre_products, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :labels, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :jakets, reject_if: :all_blank, allow_destroy: true

  accepts_attachments_for :jakets, attachment: :image

  validates :format, presence: true
  validates :title, presence: true
  validates :stock, presence: true
  validates :status, presence: true
  validates :price, presence: true

  def self.search(search)
    if search
      Product.where(['title LIKE ?', "%#{search}%"])
    else
      Product.all
    end
  end

end
