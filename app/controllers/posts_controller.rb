class PostsController < ApplicationController
  def index
      @posts = Post.all
  end

  def show
      @post = Post.find(params[:id])
  end

  def new
      @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      if @post.save
          flash[:success] = '投稿されました'
          redirect_to @post
      else
          flash.now[:danger] = '投稿されませんでした'
          render :new
      end
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      
      flash[:success] = '投稿は削除されました'
      redirect_to posts_url
  end
end
private
    def post_params
        params.require(:post).permit(:content, :title, :image)
    end
