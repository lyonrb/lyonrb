require 'spec_helper'

describe ApplicationHelper do
  
  
  describe 'page_title' do    
    it 'should return the @content_for_page_title' do
      helper.content_for(:page_title, 'N/A')
      helper.page_title.should eql('LyonRb - N/A')
    end
    
    it 'should return the default content' do
      helper.page_title.should eql('LyonRb - Welcome!')
    end
  end
end
