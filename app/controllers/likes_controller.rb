class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_like, only: [:like, :dislike]

  def like
    if already_liked?
      @like.destroy
    elsif already_disliked?
      @like.destroy
      @post.likes.create(user_id: current_user.id, like: true)
    else
      @post.likes.create(user_id: current_user.id, like: true)
    end
    redirect_to post_path(@post)
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id], like: true).present?
  end

  def already_disliked?
    Like.where(user_id: current_user.id, post_id: params[:post_id], like: false).present?
  end

  def dislike
    if already_disliked?
      @like.destroy
    elsif already_liked?
      @like.destroy
      @post.likes.create(user_id: current_user.id, like: false)
    else
      @post.likes.create(user_id: current_user.id, like: false)
    end
    redirect_to "#btn_group"
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find { |like| like.user_id == current_user.id}
  end
end