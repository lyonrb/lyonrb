require 'spec_helper'

describe Admin::CategoriesController do
  include Devise::TestHelpers
  before :each do
    @user = member_login Factory(:admin)
    @category = Factory(:category)
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
    it 'should create a new category' do
      lambda do
        post :create, :category => Factory.attributes_for(:category)
      end.should change(Category, :count).by(1)
      response.should be_redirect
    end
  end
  
  describe 'edit' do
    it 'should succeed' do
      get :edit, :id => @category.to_param
    end
  end
  
  describe 'update' do
    it 'should update a category' do
      put :update, :id => @category.to_param, :category => {:title => 'Meetings'}
      response.should be_redirect
      @category.reload
      @category.title.should eql('Meetings')
    end
  end
  
  describe 'destroy' do
    it 'should destroy a category' do
      lambda do
        delete :destroy, :id => @category.to_param
      end.should change(Category, :count).by(-1)
      response.should be_redirect
    end
  end

end
