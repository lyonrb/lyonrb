require 'spec_helper'

describe Admin::EventsController do
  include Devise::TestHelpers
  before :each do
    @user = member_login Factory(:member)
    @event = Factory(:event)
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end
  
  describe 'show' do
    it 'should succeed' do
      get :show, :id => @event.to_param
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
    it 'should create a new event' do
      lambda do
        post :create, :event => Factory.attributes_for(:event)
      end.should change(Event, :count).by(1)
      response.should be_success
    end
  end
  
  describe 'edit' do
    it 'should succeed' do
      get :edit, :id => @event.to_param
    end
  end
  
  describe 'update' do
    it 'should update an event' do
      put :update, :id => @event.to_param, :event => {:name => 'RubyCamp'}
      response.should be_success
      @event.reload
      @event.name.should eql('RubyCamp')
    end
  end
  
  describe 'destroy' do
    it 'should destroy an event' do
      lambda do
        delete :destroy, :id => @event.to_param
      end.should change(Event, :count).by(-1)
      response.should be_redirect
    end
  end

end
