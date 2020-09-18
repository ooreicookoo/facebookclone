class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_with_http_digest, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @feed = current_user.feeds.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash.now[:denger] = 'エラーがあります'
      render :new
    end
  end

  def edit
  end

  def apdate
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = 'エラーがあります'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
