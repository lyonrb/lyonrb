require 'spec_helper'

describe CategoriesController do
  include Devise::TestHelpers
  
  before :each do
    @category = Factory(:category)
  end
  
  describe 'show' do
    it 'should succeed' do
      get :show, :id => @category.to_param
      response.should be_success
    end
    
    it 'should fail if the category does not exists' do
      lambda do
        get :show, :id => '42'
      end.should raise_error ActiveRecord::RecordNotFound
    end
  end
end
