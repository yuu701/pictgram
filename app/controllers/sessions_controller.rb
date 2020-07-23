class SessionsController < ApplicationController
  def new
  end
  
  def create
    # user = User.find_by(email: params[:session][:email])
    # if user && user.authenticate(params[:session][:password])
    user = User.find_by(email_params)
    # email_paramsでシンボルを渡している
    if user && user.authenticate(password_params[:password])
      # password_params[:password]でパスワードそのものを渡している
      log_in user
      # log_in(user)と同じ意味。別の書き方ができる。log_in メソッドに引数userを渡している。
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
      # render action: :new の略。同じコントローラー内のnewアクションを表示させる。
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def email_params
    params.require(:session).permit(:email)
  end
  
  def password_params
    params.require(:session).permit(:password)
  end
end
