class HomeController < ApplicationController
  def index
  	if !session[:user]
  		redirect_to '/signin'
	else
		@useremail = current_user[:email]
		@books = Book.email_search(@useremail)
		end
	end
end
