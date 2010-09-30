class Admin::PagesController < Admin::BaseController
  before_filter :find_page, :only => [:edit, :update, :show, :destroy]
  
  def index
    @pages = Page.all
  end
  
  def new
    @page = Page.new
  end
  
  def edit
    render :new
  end
  
  def create
    @page = Page.new params[:page]
    if @page.save
      redirect_to admin_pages_url
    else
      render :new
    end
  end
  
  def update
    if @page.update_attributes params[:page]
      redirect_to admin_pages_url
    else
      render :new
    end
  end
  
  def destroy
    @page.destroy
    redirect_to admin_events_path
  end
  
  private
  def find_page
    @page = Page.find_by_permalink(params[:id])
    raise ActiveRecord::RecordNotFound if @page.nil?
  end
end
