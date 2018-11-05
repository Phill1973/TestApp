class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    #wenn ein aktueller benutzer eingeloggt ist gibt er die id zurück
    @current_user ||= User.find(session[:user_id]) if session[:user_id]    
  end
  
  def logged_in?
    !!current_user   
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "Sie müssen eingeloggt sein!"
      redirect_to root_path 
    end
  end
end
