class HomeController < ApplicationController
  def index
	  	if !session.empty?
			redirect_to '/welcome' 
		else
			@user = User.find(session[:user_id])
		end
  end
end
