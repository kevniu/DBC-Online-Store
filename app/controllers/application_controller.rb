class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session[:user_id] != nil
  end

  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_cart
    @current_cart ||= Cart.find_by(user_id: current_user.id, status: 0) if session[:user_id]
  end

  helper_method :current_cart

  def quantities
    @quantities = Hash.new(0)
    current_cart.products.each do |p|
      @quantities[p.name] += 1
    end
  end

  helper_method :quantities

end
