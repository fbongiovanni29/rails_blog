class HomeController < ApplicationController
  def index
	  	if session[:user_id].nil?	 
			redirect_to '/welcome' 
		else
			@user = User.find(session[:user_id])
  		end
  end
end
