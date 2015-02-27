class UserController < ApplicationController
include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:user][:email], password: params[:user][:password])
    if @user.save
      redirect_to login_path
    else
      @error = "Your username or password is invalid"
      render :new
    end
  end

end
