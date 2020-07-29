class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    # @user = User.new(name: params[:user][:name], email: params[:user][:email]) 悪意あるユーザーが不正なデータを送信しても受け取ってしまうので変更。
    @user = User.new(user_params)
    if @user.save
      # flash[:success]="登録が完了しました"
      # redirect_to root_pathを１行で書いた記述。
      # noticeじゃなくsuccessを使うのはBootstrapで定義されているcssを用いるため。
      # BootstrapBootstrapで使えるのはsuccess,info,warning,dangerの４種類。
      redirect_to root_path, success: '登録が完了しました'
    else
      # redirect_toの時はflash,renderのときはflash.nowを使う。
      # flashは直後のリクエスト後に表示される。ルーティングに返すredirect_toの時には表示されるが、
      # ルーティングに返さず直接ビューを表示するrenderの時はflash.nowを使う。
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def user_params
    # .requireメソッドがデータのオブジェクト名を定め、.permitメソッドで変更を加えられる（保存の処理ができる）キーを指定する。
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
