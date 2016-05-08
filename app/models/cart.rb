class Cart < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :products

  enum status: {in_cart: 0, purchased: 1}

  def total_price
    self.products.inject(0){|sum, p| sum + p.price}
  end

end
