class SessionsController < ApplicationController

  def new
  end

  def create
    puts "LOG LOOKING FOR EMAIL: #{params[:session][:email]} "
    @user = User.find_by email: params[:session][:email]
    if @user
      @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Login successful."
      if @user.role == "admin"
        redirect_to admins_path
      else
        redirect_to products_path
      end
    else
      flash[:danger] = "Login failed. Invalid email or password."
      redirect_to login_path
    end

  end

  def destroy
    session.clear
    flash[:success] = "Logout successful."
    redirect_to products_path
  end

end
