class UsersController < ApplicationController
  def index
	  @user = User.find(session[:user_id])
  end

  def new
	  @user = User.new
  end

  def show
#	@user = User.find(params[:id])
#	@posts = @user.posts.all
#	@post = Post.new
#	@current_user = User.find(session[:user_id])
        post = Post.new(posts_params.merge(user_id: current_user.id))
	        if post.save
			redirect_to '/'
	        else
	                redirect_to new_post_path
	        end
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

  private

  def user_params
	params.require(:user).permit(:email, :password, :name, :avatar)
  end
end
