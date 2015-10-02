class SessionsController < ApplicationController
  def new
  end
 def create
     user = User.find_by(email: params[:session][:email].downcase)
     admin =Admin.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
     log_in user
     redirect_to user
    elsif admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to admin
    else
	render 'new'      
	flash.now[:danger] = 'Invalid email/password combination'
      
    end
 end
  def destroy
  end

end
