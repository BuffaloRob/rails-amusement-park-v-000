class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user.email = params[:user][:email]
    # @user.password = params[:user][:password]
    if @user.save
      session[:user_id] = @user.id
      raise params.inspect
      redirect_to user_path(@user)
    else
      render :new
    end

  def update
    ##
  end

  def show
    
  end

  def edit
  end

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height,:admin)
  end

end
