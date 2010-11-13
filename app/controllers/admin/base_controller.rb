class Admin::BaseController < ApplicationController
  before_filter :authorization
  
  rescue_from CanCan::AccessDenied do |exception|
    render 'errors/401', :layout => 'application'
  end
  
  private
  def authorization
    authorize! :manage, :admin
  end
end