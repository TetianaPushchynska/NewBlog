class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_comment, except: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post), success: "Коментар успішно створено"
    else
      flash.now[:danger] = "Коментар не створено"
      render :new
    end
  end

  def edit; end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@post), success: "Коментар успішно оновлено"
    else
      flash.now[:danger] = "Коментар не оновлено"
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post), success: "Коментар успішно видалено"
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description, :user_id, :post_id)
  end
end