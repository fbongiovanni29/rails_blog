class PostsController < ApplicationController
  def new
  end

  def create

	  current_user = User.find(session[:user_id])

        post = Post.new(post_params.merge(user_id: current_user.id))
	if post.save
		redirect_to '/'
        else
	        redirect_to new_post_path
        end
  end

  def index
  end

  private

  def post_params
	    params.require(:post).permit(:title, :body)
  end
end
