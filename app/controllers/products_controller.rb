class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @categories = Category.all
    @cart = current_cart
  end

  def show
    @cart = current_cart
    @product = Product.find(params[:id])
  end

  def new
    redirect_to products_path if current_user.role == "customer"
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Product was successfully created."
      redirect_to admins_path
    else
      flash[:danger] = @product.errors.full_messages
      redirect_to admins_path
    end
  end

  def edit
    redirect_to products_path if current_user.role == "customer"
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product was successfully updated."
      redirect_to admins_path
    else
      flash[:danger] = @product.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "Product was successfully destroyed."
      redirect_to admins_path
    else
      flash[:danger] = "Product failed to destroy."
      redirect_to admins_path
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity)
  end


end
