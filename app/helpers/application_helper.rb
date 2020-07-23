module ApplicationHelper
  # application_helperなどのhelperはviewで使用する共通のコードを指定する
  
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end
  
  # def logged_in?
  #   !current_user.nil?
  # end
  
  # Dry(同じコードは繰り返し書かない)というRailsの設計理念に違反するために削除が必要。
  # application_controller内に記述した helper_method :current_user, :logged_in?　により削除が可能になる。
 
  
end
