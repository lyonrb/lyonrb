# encoding: UTF-8
class Post < ActiveRecord::Base
  
  validates_presence_of    :title, :content, :category_id
  attr_accessible          :title, :content, :category_id, :published, :published_at
  
  belongs_to               :category
  has_many                 :comments
  
  before_validation        :default_values
   
  scope :published, lambda {
    where('published = ? AND published_at <= ?', true, Time.now)
  }
  
  scope :drafts, lambda {
    where('published = ? OR published_at > ?', false, Time.now)
  }
  
  scope :lasts, lambda {
    order('posts.created_at DESC')
  }
  
  def published?
    published && published_at <= Time.now
  end
  
  private
  def default_values
    self.published_at = Time.now      if self.published_at.nil?
  end
end
