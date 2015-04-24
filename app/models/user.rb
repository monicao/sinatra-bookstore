class User < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders  # products ordered by user

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end