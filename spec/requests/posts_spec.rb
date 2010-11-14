require 'spec_helper'

describe "Posts" do
  include Warden::Test::Helpers
  
  before :each do
    @post = Factory(:post)
    @category = Factory(:category)
    login_as Factory(:admin)
  end
  
  describe 'show the posts index' do
    it 'should succeed to render the page' do
      get admin_posts_url
      response.should be_success
    end
  end
  
  describe 'show the post' do
    it 'should succeed to render the post' do
      get "/blog/#{@post.category.to_param}/#{@post.to_param}"
      response.should be_success
    end
  end
  
  describe 'new post' do
    it 'should succeed to render the new form' do
      get new_admin_post_url
      response.should be_success
    end
    
    it 'should succeed to create a new post' do
      lambda do
        visit new_admin_post_url
        fill_in 'post[title]', :with => 'Hello World'
        fill_in 'post[content]', :with => 'Hey !!'
        select @category.title, :from => 'post[category_id]'
        click_button 'Create Post'
      end.should change(Post, :count).by(1)
    end
  end
  
  describe 'editing a categor' do
    before :each do
      @post = Factory(:post)
    end
    
    it 'should succeed to render the edit form' do
      get edit_admin_post_url(@post)
      response.should be_success
    end
    
    it 'should succeed to update the category' do
      lambda do
        visit edit_admin_post_url(@post)
        fill_in 'post[title]', :with=> 'Hello World'
        click_button 'Update Post'
      end.should change(Post, :count).by(0)
      
      @post.reload
      @post.title.should eql('Hello World')
    end
  end
end
