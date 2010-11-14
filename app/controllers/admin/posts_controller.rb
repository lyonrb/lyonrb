class Admin::PostsController < Admin::BaseController
  before_filter :find_post, :only => [:edit, :update, :show, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    render :new
  end
  
  def create
    @post = Post.new params[:post]
    if @post.save
      redirect_to admin_posts_url
    else
      render :new
    end
  end
  
  def update
    if @post.update_attributes params[:post]
      redirect_to admin_posts_url
    else
      render :new
    end
  end
  
  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end
  
  private
  def find_post
    @post = Post.find params[:id]
  end
end
