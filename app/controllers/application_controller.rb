class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :is_admin?

  protected

    def admin?
      if current_user.is_admin == true
        true
      else
        false
      end
    end

    def authorised
      unless admin?
        flash[:error] = "Unauthorised Access!"
        redirect_to movies_path
        false
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

end
