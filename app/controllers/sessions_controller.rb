class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      p "HIIIIIII"
      p session.inspect
      redirect_to todos_path
    else
      @errors = "Your email or password sucked"
      render :new
    end
  end

  def destroy
  session[:user_id] = nil
  redirect_to login_path
  end

end
