class Product < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders

  validates :name, presence: true

  # Not recommended because the code below   # is view logic. It does not belong
  # in the model
  # def price_with_dollars
  #   "$#{self.price_in_cents / 100.0}"
  # end
end
