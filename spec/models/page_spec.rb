require 'spec_helper'

describe Page do
  it 'should create a new page' do
    lambda do
      Page.create! Factory.attributes_for(:page)
    end.should change(Page, :count).by(1)
  end
  
  [:title, :permalink, :content].each do |field|
    it "should require a #{field}" do
      Page.new.should have(1).error_on(field)
    end
  end
  
  it 'should not have twice the same permalink' do
    Page.new(:permalink => Factory(:page).permalink).should have(1).error_on(:permalink)
  end
end
