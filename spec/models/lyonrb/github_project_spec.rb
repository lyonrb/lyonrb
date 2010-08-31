require 'spec_helper'

describe Lyonrb::GithubProject do
  before :all do
    HttpMocks.repositories_list
  end
  
  describe 'initialize' do
    it 'should not fail to initialize' do
      lambda do
        Lyonrb::GithubProject.new(
          :name => 'lyonrb',
          :description => 'Ruby at Lyon Rox !',
          :homepage => 'http://lyonrb.fr'
        )
      end.should_not raise_error
    end
    
    [:name, :description, :homepage].each do |attribute|
      it "should have an accesible #{attribute}" do
        Lyonrb::GithubProject.new(attribute => 'lyonrb').send(attribute).should eql('lyonrb')
      end
      
      it "should have a nil #{attribute}" do
        Lyonrb::GithubProject.new.send(attribute).should be_nil
      end
    end
  end
  
  describe 'all' do
    it 'should not fail' do
      lambda do
        Lyonrb::GithubProject.all
      end.should_not raise_error
    end
    
    it 'should return an array of Lyonrb::GithubProject object' do
      Lyonrb::GithubProject.all.should be_kind_of Array
      Lyonrb::GithubProject.all.each do |project|
        project.should be_kind_of Lyonrb::GithubProject
      end
    end
    
    [:name, :description, :homepage].each do |attribute|
      it "should create objects with #{attribute}" do
        Lyonrb::GithubProject.all.each do |project|
          project.send(attribute).should_not be_nil
        end
      end
    end
  end
end
