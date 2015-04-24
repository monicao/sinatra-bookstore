class Product < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders

  validates :name, presence: true
  validates :price_in_cents, presence: true

  # We could use a method on the model to display the price to the user
  # but this is not ideal, because the model's job is to work with data.
  # The model should not have to worry about presentation / ui.
  # The best place for this code is a view helper
  def pretty_price
    "$#{price_in_cents / 100.0}"
  end
end