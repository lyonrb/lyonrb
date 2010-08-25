require 'spec_helper'

describe Admin::IndexController do
  include Devise::TestHelpers
  before :each do
    @user = member_login Factory(:member)
  end
  
  describe 'index' do
    it 'should succeed' do
      get :index
      response.should be_success
    end
  end
end
