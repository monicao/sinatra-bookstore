class Product < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders

  validates :name, presence: true
  validates :price_in_cents, presence: true

  def expensive?
    price_in_cents > 10000
  end
end
