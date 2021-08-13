# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    like = current_user.likes.build(post_id: params[:post_id])
    like.save
    flash[:success] = 'お気に入りを登録しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    flash[:success] = 'お気に入り登録を外しました'
    redirect_back(fallback_location: root_path)
  end
end
