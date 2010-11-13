require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  
  context "admin" do
    before :each do
      @user = Factory(:admin)
      @ability = Ability.new(@user)
    end
    
    it "should be able to manage anything" do
      @ability.should be_able_to(:manage, :all)
    end
  end
  
  context "not admin" do
    before :each do
      @user = Factory(:member)
      @ability = Ability.new(@user)
    end
    
    it "should not be able to manage anything" do
      @ability.should_not be_able_to(:manage, :all)
    end
  end
  
  context "guest" do
    before :each do
      @ability = Ability.new(nil)
    end
    
    it "should not be able to manage anything" do
      @ability.should_not be_able_to(:manage, :all)
    end
  end
end