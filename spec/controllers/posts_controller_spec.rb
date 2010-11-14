require 'spec_helper'

describe PostsController do
  include Devise::TestHelpers
  
  before :each do
    @post = Factory(:post)
  end
  
  describe 'show' do
    it 'should succeed' do
      get :show, :id => @post.to_param, :category_id => @post.category.to_param
      response.should be_success
    end
    
    it 'should fail if the category is inappropriate' do
      lambda do
        get :show, :id => @post.to_param, :category_id => 'testing'
      end.should raise_error ActiveRecord::RecordNotFound
    end
    
    it 'should fail if the post does not exists' do
      lambda do
        get :show, :id => '42', :category_id => @post.category.to_param
      end.should raise_error ActiveRecord::RecordNotFound
    end
  end
end
