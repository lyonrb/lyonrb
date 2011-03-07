require 'spec_helper'

describe "Pages" do
  include Warden::Test::Helpers

  before :each do
    @page = Factory(:page)
    login_as Factory(:admin)
  end

  describe 'show the pages index' do
    it 'should succeed to render the page' do
      get admin_pages_url
      response.should be_success
    end
  end

  describe 'show the page' do
    it 'should succeed to render the page' do
      get "/#{@page.to_param}"
      response.should be_success
    end
  end

  describe 'new page' do
    it 'should succeed to render the new form' do
      get new_admin_page_url
      response.should be_success
    end

    it 'should succeed to create a new page' do
      lambda do
        visit new_admin_page_url
        fill_in 'page[title]', :with => 'My Cool New Page'
        fill_in 'page[permalink]', :with => 'my-cool-new-page'
        fill_in 'page[content]', :with => 'My Beautiful Content'
        click_button 'Create Page'
      end.should change(Page, :count).by(1)
    end
  end

  describe 'editing a page' do
    before :each do
      @page = Factory(:page)
    end

    it 'should succeed to render the edit form' do
      get edit_admin_page_url(@page)
      response.should be_success
    end

    it 'should succeed to update the page' do
      lambda do
        visit edit_admin_page_url(@page)
        fill_in 'page[title]', :with => 'My Cool Edited Page'
        fill_in 'page[permalink]', :with => 'my-cool-edited-page'
        fill_in 'page[content]', :with => 'My Beautiful Content'
        click_button 'Update Page'
      end.should change(Page, :count).by(0)

      @page.reload
      @page.title.should eql('My Cool Edited Page')
    end
  end
end
