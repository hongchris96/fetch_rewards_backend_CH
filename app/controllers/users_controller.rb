class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end
  
  def new
    render :new
  end

  # don't need this route because can save user in transaction create
  def create
    @user = User.new(username: params[:user][:username], balance: 0)
    if @user.save
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  # don't need this route because can save user in transaction create
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_url(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
