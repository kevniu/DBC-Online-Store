class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = User.roles[:customer]
    if @user.save
      Cart.create(user: @user)
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver_now
      flash[:success] = "Account was successfully created."
      redirect_to products_path
    else
      flash[:danger] = "Username or password is invalid or already taken, please try again."
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
