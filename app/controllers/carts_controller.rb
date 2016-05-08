class CartsController < ApplicationController
  protect_from_forgery :except => [:destroy]

  def index
    @carts = Cart.where(user_id: current_user.id, status: 1)
  end

  def show
    @products = current_cart.products.uniq
    @total_price = current_cart.total_price
    quantities
  end

  def create
  end

  def update
    if request.xhr?
      product = Product.find(params[:product_id])
      product_quantity = params[:quantity].to_i
      quantities
      if product.quantity < product_quantity || (@quantities[product.name] + product_quantity) > product.quantity
        flash[:danger] = "Please enter a quantity less than the stock available"
        redirect_to products
      else
        product_quantity.times do
          current_cart.products << product
        end
        @cart = current_cart
        @products = current_cart.products.uniq
        @total_price = current_cart.total_price
        quantities
        render partial: 'cart', locals: {products: @products, quantities: @quantities, total_price: @total_price}
      end
    else
      p params
      product = Product.find(params[:cart][:item_id])
      product_quantity = params[:name][:quantity].to_i
      quantities
      if product.quantity < product_quantity || (@quantities[product.name] + product_quantity) > product.quantity
        flash[:danger] = "Please enter a quantity less than the stock available"
        redirect_to product
      else
        product_quantity.times do
          current_cart.products << product
        end
        @cart = current_cart
        @products = current_cart.products.uniq
        @total_price = current_cart.total_price
        quantities
        redirect_to cart_path
      end
    end
  end

  def destroy
    product = Product.find(params[:id])
    if request.xhr?
      current_cart.products.delete(product)
      @products = current_cart.products.uniq
      @total_price = current_cart.total_price
      quantities
      render partial: 'cart', locals: {products: @products, quantities: @quantities, total_price: @total_price}
    else
      current_cart.products.delete(product)
      redirect_to current_cart
    end
  end

  def checkout
    @products = current_cart.products.uniq
    @total_price = current_cart.total_price
    quantities
    Product.all.each do |product|
      product.quantity -= @quantities[product.name]
      product.save
    end
    CheckoutMailer.checkout_email(current_user, current_cart).deliver_now
    current_cart.status = 1
    current_cart.save
    Cart.create(user_id: current_user.id)
  end

end
