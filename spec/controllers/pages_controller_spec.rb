require 'spec_helper'

describe PagesController do
  include Devise::TestHelpers
  
  before :each do
    @page = Factory(:page)
  end
  
  describe 'show' do
    it 'should succeed' do
      get :show, :id => @page.to_param
      response.should be_success
    end
    
    it 'should fail if the page does not exists' do
      lambda do
        get :show, :id => '42'
      end.should raise_error ActiveRecord::RecordNotFound
    end
  end
end
