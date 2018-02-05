class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    before = !!@current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    if !before && @current_user
      if @current_user.activity_count.nil?
        @current_user.activity_count = 1
      else
        @current_user.activity_count += 1
      end
      @current_user.save
    end
    @current_user
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
