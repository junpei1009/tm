class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :orders
  has_many :deliveries, dependent: :destroy
  has_many :carts

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :tell, presence: true
  validates :birthday, presence: true
  validates :customer_postal_code, presence: true
  validates :customer_prefecture, presence: true
  validates :customer_city, presence: true
  validates :customer_street_address, presence: true
end
