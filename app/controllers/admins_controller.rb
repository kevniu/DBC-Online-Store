class AdminsController < ApplicationController

  def index
    if current_user.role == "admin"
      @products = Product.all
    else
      redirect_to products_path
    end
  end

end
