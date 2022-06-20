class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  #Any helper_methods you wish to use in views must be stated here. Controllers don't need this declaration. 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to perfom that action"
      redirect_to login_path
    end
  end
end
