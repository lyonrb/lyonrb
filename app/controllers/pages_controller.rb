class PagesController < ApplicationController
  
  def show
    @page = Page.find_by_permalink(params[:id])
    raise ActiveRecord::RecordNotFound if @page.nil?
  end
end
