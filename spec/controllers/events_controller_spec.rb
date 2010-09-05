require 'spec_helper'

describe EventsController do
  include Devise::TestHelpers
  
  describe 'index' do
    it 'should succeed' do
      get :index
      response.should be_success
    end
    
    it 'should succeed in xml' do
      get :index, :format => 'xml'
      response.should be_success
    end
  end
end
