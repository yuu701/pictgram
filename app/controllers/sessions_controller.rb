class SessionsController < ApplicationController
  def new
  end
  
  def create
    # ストロングパラメータなしの記述
    # user = User.find_by(email: params[:session][:email])
    # if user && user.authenticate(params[:session][:password])
    
    # email_paramsの返り値は{email: params[:email]}なのでシンボルを指定しなくて良い。
    user = User.find_by(email_params)
    # password_paramsの返り値は{password: params[:password]}
    # authenticateにハッシュ化されていないパスワードの値を渡すと合っているか確認してくれるので、渡す際にはパスワードの値のみ渡したい。
    # password_params[:password]と指定することでパスワードの値のみ取り出せる。
    if user && user.authenticate(password_params[:password])
    # log_in(user)と同じ意味。別の書き方ができる。log_in メソッドに引数userを渡している。
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      # render action: :new の略。同じコントローラー内のnewアクションを表示させる。
      render :new
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
