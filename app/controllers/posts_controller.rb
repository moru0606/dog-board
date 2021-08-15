# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_user_logged_in?
  before_action :unsuer_correct_user, only: [:destroy]

  def index
    @pagy, @posts = pagy(params[:category_id].present? ? Category.find(params[:category_id]).posts.order(id: :desc) : Post.order(id: :desc))
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿されました'
      redirect_to @post
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:success] = '投稿は削除されました'
    redirect_to posts_url
  end
end

private

def post_params
  params.require(:post).permit(:content, :title, :image, :category_id)
end

def unsuer_correct_user
  @post = current_user.posts.find_by(id: params[:id])
  unless @post
    flash[:warning] = 'あなたに権限がありません'
    redirect_to root_url
  end
end