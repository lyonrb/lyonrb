require 'spec_helper'

describe "Categories" do
  include Warden::Test::Helpers
  
  before :each do
    @category = Factory(:category)
    login_as Factory(:admin)
  end
  
  describe 'show the categories index' do
    it 'should succeed to render the page' do
      get admin_categories_url
      response.should be_success
    end
  end
  
  describe 'show the category' do
    it 'should succeed to render the category' do
      get "/blog/#{@category.to_param}"
      response.should be_success
    end
  end
  
  describe 'new category' do
    it 'should succeed to render the new form' do
      get new_admin_category_url
      response.should be_success
    end
    
    it 'should succeed to create a new categroy' do
      lambda do
        visit new_admin_category_url
        fill_in 'category[title]', :with => 'My Cool New Category'
        click_button 'Create Category'
      end.should change(Category, :count).by(1)
    end
  end
  
  describe 'editing a categor' do
    before :each do
      @category = Factory(:category)
    end
    
    it 'should succeed to render the edit form' do
      get edit_admin_category_url(@category)
      response.should be_success
    end
    
    it 'should succeed to update the category' do
      lambda do
        visit edit_admin_category_url(@category)
        fill_in 'category[title]', :with => 'My Cool Edited Category'
        click_button 'Update Category'
      end.should change(Category, :count).by(0)
      
      @category.reload
      @category.title.should eql('My Cool Edited Category')
    end
  end
end
