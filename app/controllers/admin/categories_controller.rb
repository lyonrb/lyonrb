class Admin::CategoriesController < Admin::BaseController
  before_filter :find_category, :only => [:edit, :update, :show, :destroy]
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def edit
    render :new
  end
  
  def create
    @category = Category.new params[:category]
    if @category.save
      redirect_to admin_categories_url
    else
      render :new
    end
  end
  
  def update
    if @category.update_attributes params[:category]
      redirect_to admin_categories_url
    else
      render :new
    end
  end
  
  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end
  
  private
  def find_category
    @category = Category.find params[:id]
  end
end
