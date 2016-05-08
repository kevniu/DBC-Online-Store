class Product < ActiveRecord::Base

  belongs_to :category

  has_and_belongs_to_many :carts

  validates :price, :quantity, numericality: true
  validates :name, :description, :price, :quantity, presence: true

end
