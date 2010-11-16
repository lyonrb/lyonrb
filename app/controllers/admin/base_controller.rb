class Admin::BaseController < ApplicationController
  before_filter :authorization
  
  rescue_from CanCan::AccessDenied do |exception|
   render 'errors/403', :layout => 'application', :status => 403
  end
  
  private
  def authorization
    authorize! :manage, :admin
  end
end
