require 'spec_helper'

describe Admin::IndexController do
  include Devise::TestHelpers

  describe 'index' do
    context "when not logged in" do
      it 'should be forbidden' do
        get :index
        response.status.should == 403
      end
    end

    context "when logged in as admin" do
      before :each do
        @user = member_login Factory(:admin)
      end

      it 'should succeed' do
        get :index
        response.should be_success
      end
    end
  end
end
