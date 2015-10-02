module SessionsAdminsHelper
def admin_login(admin)
    session[:admin_id] = admin.id
  end
end
