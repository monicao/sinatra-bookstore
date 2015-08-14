class Product < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders

  validates :name, presence: true
  validates :price_in_cents, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
