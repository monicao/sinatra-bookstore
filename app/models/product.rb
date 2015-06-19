class Product < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders

  def formatted_price
    "$#{price_in_cents / 100.0}"
  end
end
