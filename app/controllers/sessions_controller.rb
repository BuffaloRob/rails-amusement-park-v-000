class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    # raise params.inspect
    @user = User.find_by(:name => params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user), notice: "Welcome Back"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path 
  end

end