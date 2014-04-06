class UserController < ApplicationController
  def login
    session[:login] = 1
    session[:cart] = nil
    flash[:notice] = "User successfully logged in"
    redirect_to :controller => :books
  end

  def admin_login
    session[:login] = 1
    session[:cart] = nil
    flash[:notice] = "Admin user successfully logged in, cart reset."
    redirect_to :controller => :books
  end

 def logout
    session[:login] = nil
    session[:cart] = nil
    flash[:notice] = "User logged out, A3."
    redirect_to :controller => :home      
  end
  
    def sign_out
    session[:login] = nil
    session[:cart] = nil
    flash[:notice] = "User logged out, A4."
    redirect_to :controller => :home
  end
end
