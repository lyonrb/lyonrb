require 'spec_helper'

describe WelcomeController do
  include Devise::TestHelpers
  
  describe 'index' do
    before :all do
      HttpMocks.repositories_list
      HttpMocks.members_list
    end
    it 'should succeed' do
      get :index
      response.should be_success
    end
  end
end
