require 'spec_helper'

describe Admin::PagesController do
  include Devise::TestHelpers
  before :each do
    @user = member_login Factory(:member)
    @page = Factory(:page)
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
    it 'should create a new page' do
      lambda do
        post :create, :page => Factory.attributes_for(:page)
      end.should change(Page, :count).by(1)
      response.should be_redirect
    end
  end
  
  describe 'edit' do
    it 'should succeed' do
      get :edit, :id => @page.to_param
    end
  end
  
  describe 'update' do
    it 'should update a page' do
      put :update, :id => @page.to_param, :page => {:title => 'Weekly Lunch'}
      response.should be_redirect
      @page.reload
      @page.title.should eql('Weekly Lunch')
    end
  end
  
  describe 'destroy' do
    it 'should destroy a page' do
      lambda do
        delete :destroy, :id => @page.to_param
      end.should change(Page, :count).by(-1)
      response.should be_redirect
    end
  end

end
