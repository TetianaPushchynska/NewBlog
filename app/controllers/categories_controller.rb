class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def show
    @posts = Post.where(category_id: [@category.subtree_ids]).page(params[:page])
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end