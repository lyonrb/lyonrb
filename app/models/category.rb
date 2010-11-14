# encoding: UTF-8
class Category < ActiveRecord::Base
  validates_presence_of    :title
  attr_accessible          :title
  has_many                 :posts
  
  
end
