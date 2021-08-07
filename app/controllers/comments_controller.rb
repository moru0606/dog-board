class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      flash[:success] = 'コメントを投稿しました'
      redirect_to post_path(@post)
    else
      flash[:danger] = 'コメント投稿に失敗しました'
      redirect_back(fallback_location: posts_path)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = 'コメントを削除しました'
    redirect_to post_path(@post)
  end
end

private

def comment_params
  params.require(:comment).permit(:comment, :image)
end
