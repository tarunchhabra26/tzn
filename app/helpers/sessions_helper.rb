module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user] = user
    session[:email] = user.email
  end
  # Returns the current logged-in user (if any).
  def current_user
    @current_user = User.find_by_email(session[:email])
    #user = User.find_by_email(params[:session][:email])
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def isadmin
    if (session[:user] != nil)
      current_user[:is_admin]
    else
      false
    end
  end

end