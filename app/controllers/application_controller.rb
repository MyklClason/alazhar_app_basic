class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    if current_user.nil?
    flash[:error] = "Not logged in!"
    redirect_to login_url
    end
  end

  def authorize_admin
    if current_user_admin.nil?
    flash[:error] = "You don't have permission to view this page!"
    redirect_to login_url
    end
  end

  private

  def current_user
  	if session[:user_id]
  	@current_user = User.find(session[:user_id])
  	end
  end

  def current_user_admin
    if session[:user_id] && User.find(session[:user_id]).admin
      @current_user_admin = User.find(session[:user_id])
    end
  end

  helper_method :current_user
  helper_method :current_user_admin
end
