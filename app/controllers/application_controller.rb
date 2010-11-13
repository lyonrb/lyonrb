class ApplicationController < ActionController::Base
  protect_from_forgery
  
  alias :current_user :current_member
end
