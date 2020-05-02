class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.search params[:search], with: {status: 1}, ranker: :proximity_bm25
  end

  def new
    @post = Post.new
  end

  def show; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: "Стаття успішно створена"
    else
      flash.now[:danger] = "Стаття не створена"
      render :new
    end
  end

  def edit; end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: "Стаття успішно оновлена"
    else
      flash.now[:danger] = "Стаття не оновлена"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: "Стаття успішно видалена"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :all_tags, :category_id, :user_id, images: [])
  end
end