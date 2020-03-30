class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment, success: "Коментар успішно створено"
    else
      flash.now[:danger] = "Коментар не створено"
      render :new
    end
  end

  def edit; end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to @comment, success: "Коментар успішно оновлено"
    else
      flash.now[:danger] = "Коментар не оновлено"
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_path, success: "Коментар успішно видалено"
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end