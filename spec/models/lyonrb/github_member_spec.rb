require 'spec_helper'

describe Lyonrb::GithubMember do
  before :all do
    HttpMocks.members_list
  end
  
  describe 'initialize' do
    it 'should not fail to initialize' do
      lambda do
        Lyonrb::GithubMember.new(
          :name => 'dmathieu',
          :login => 'dmathieu',
          :avatar => 'http://www.example.com',
          :email => 'nothing@test.host'
        )
      end.should_not raise_error
    end
    
    [:name, :login, :avatar].each do |attribute|
      it "should have an accesible #{attribute}" do
        Lyonrb::GithubMember.new(attribute => 'lyonrb').send(attribute).should eql('lyonrb')
      end
      
      it "should have a nil #{attribute}" do
        Lyonrb::GithubMember.new.send(attribute).should be_nil
      end
    end
    
    it "should have an accesible email" do
        Lyonrb::GithubMember.new(:email => 'lyonrb@test.host').email.should eql('lyonrb@test.host')
      end
      
      it "should have a default email" do
        Lyonrb::GithubMember.new.email.should eql('lyonrb@lyonrb.fr')
      end
  end
  
  describe 'all' do
    it 'should not fail' do
      lambda do
        Lyonrb::GithubMember.all
      end.should_not raise_error
    end
    
    it 'should return an array of Lyonrb::GithubMember object' do
      Lyonrb::GithubMember.all.should be_kind_of Array
      Lyonrb::GithubMember.all.each do |project|
        project.should be_kind_of Lyonrb::GithubMember
      end
    end
    
    [:login, :avatar, :email].each do |attribute|
      it "should create objects with #{attribute}" do
        Lyonrb::GithubMember.all.each do |project|
          project.send(attribute).should_not be_nil
        end
      end
    end
  end
end
