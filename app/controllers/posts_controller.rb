class PostsController < ApplicationController
  before_filter :get_category
  
  def show
    @post = @category.posts.published.find params[:id]
  end
  
  private
  def get_category
    @category = Category.find params[:category_id]
  end
end
