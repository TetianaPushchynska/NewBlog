class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: %i[show approve reject]

  def fresh_posts
    @fresh_post = Post.where(status: "fresh")
  end

  def rejected_posts
    @reject_post = Post.where(status: "rejected")
  end

  def show; end

  def approve
    @post.approved!
    redirect_to posts_path, success: "Стаття успішно підтверджена"
  end

  def reject
    @post.rejected!
    redirect_to admin_rejected_posts_path, success: "Стаття успішно відхилена"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end