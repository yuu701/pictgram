class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    # build => 親モデルに属する子モデルのインスタンスを生成したい場合に使うメソッド。
    # 外部キーに値が入った状態でインスタンスが生成できる。
    # buildはnewのaliasで、同じメソッドだけど、暗黙の了解でモデルの関連づけをした時に使う。
    @comment = @topic.comments.build(comment_params)
    # @comment = Comment.new(comment_params)
    # @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:denger] = 'コメント投稿に失敗しました'
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
