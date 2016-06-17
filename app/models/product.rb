class Product < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders

  def expensive?
    price_in_cents > 10000
  end
end
