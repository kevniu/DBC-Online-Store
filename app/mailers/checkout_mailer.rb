class CheckoutMailer < ActionMailer::Base
  default from: 'krispyshoppe@gmail.com'

  def checkout_email(user, cart)
    @user = user
    @cart = cart
    @url  = 'http://localhost:3000/sessions/new'
    @quantities = Hash.new(0)
    @cart.products.each do |p|
      @quantities[p.name] += 1
    end
    @products = @cart.products.uniq
    @total_price = @cart.total_price
    mail(to: @user.email, subject: 'Thank you for shopping at Krispy Shoppe')
  end

end
