class ApplicationController < ActionController::Base
  # application_controllerはcontrollerで共通するコードを指定する
  
  protect_from_forgery with: :exception
  # ハッカーからサイトを守るための記述
  
  add_flash_types :success, :info, :warning, :danger
  # フラッシュのキーとして使えるように登録
  
  helper_method :current_user, :logged_in?
  
  def current_user
  @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
end
