class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    session[:session_token] = user.session_token
  end

  def logout()
    if current_user
      if current_user.demo
        current_user.destroy
      else
        current_user.reset_session_token!
      end
    end
    session.delete(:session_token)
  end
end
