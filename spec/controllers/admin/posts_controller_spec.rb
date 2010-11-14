require 'spec_helper'

describe Admin::PostsController do
  include Devise::TestHelpers
  before :each do
    @user = member_login Factory(:admin)
    @post = Factory(:post)
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end
  
  describe 'new' do
    it 'should succeed' do
      get :new
      response.should be_success
    end
  end
  
  describe 'create' do
    it 'should create a new post' do
      lambda do
        post :create, :post => Factory.attributes_for(:post)
      end.should change(Post, :count).by(1)
      response.should be_redirect
    end
  end
  
  describe 'edit' do
    it 'should succeed' do
      get :edit, :id => @post.to_param
    end
  end
  
  describe 'update' do
    it 'should update a post' do
      put :update, :id => @post.to_param, :post => {:title => 'Hello World'}
      response.should be_redirect
      @post.reload
      @post.title.should eql('Hello World')
    end
  end
  
  describe 'destroy' do
    it 'should destroy a post' do
      lambda do
        delete :destroy, :id => @post.to_param
      end.should change(Post, :count).by(-1)
      response.should be_redirect
    end
  end

end
