# application_controllerはcontrollerで共通するコードを指定する
class ApplicationController < ActionController::Base
  
  # ハッカーからサイトを守るための記述
  protect_from_forgery with: :exception
  
  # フラッシュのキーとして使えるように登録
  add_flash_types :success, :info, :warning, :danger
 
  # helper_methodを記述することにより、application_helperでも以下のメソッドを使用可能にする。
  helper_method :current_user, :logged_in?
  
  def current_user
    # @current_user = @current_user || User.find_by(id: session[:user_id])
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
end
