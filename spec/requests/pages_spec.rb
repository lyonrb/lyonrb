require 'spec_helper'

describe "Pages" do
  before :each do
    @page = Factory(:page)
  end
  
  it 'should succeed to render the page' do
    get "/#{@page.to_param}"
    response.should be_success
  end
end