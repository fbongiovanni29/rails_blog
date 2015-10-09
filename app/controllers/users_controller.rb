class UsersController < ApplicationController
  def index
	  @user = User.find(session[:user_id])
  end

  def new
	  @user = User.new
  end

  def show
	@user = User.find(params[:id])
  end

  def create
  @user = User.create(user_params)
    if @user.save
      redirect_to '/welcome'
      session[:user_id] = @user.id
    else
      flash[:notice] = "Please fill out all forms!"
      redirect_to '/users/new' 
    end
  end

  def welcome
	  @user = User.find(session[:user_id])
  end

  def user_params
	params.require(:user).permit(:email, :password, :name)
  end
end
