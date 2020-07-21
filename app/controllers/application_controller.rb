class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ハッカーからサイトを守るための記述
  
  add_flash_types :success, :info, :warning, :danger
  # フラッシュのキーとして使えるように登録
end
