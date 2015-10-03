class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    password = User.find_by_password(params[:session][:password])

    if user && user.password == params[:session][:password]#password.email#&& user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
     log_in user
     #session[:user] = user
     redirect_to '/'
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    
    end
  end
  def destroy
    session[:user] = nil   
    session[:email] = nil
    redirect_to '/signin'
  end
end