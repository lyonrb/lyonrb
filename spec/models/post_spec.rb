# encoding: UTF-8
require 'spec_helper'

describe Post do
  
  it 'should require a title' do
    Post.create.errors[:title].should_not be_empty
  end
  it 'should require a content' do
    Post.create.errors[:content].should_not be_empty
  end
  
  it 'should defaultly set the publication date to now' do
    Timecop.freeze(Time.now) do
      post = Factory.build(:post)
      post.published_at = nil
      post.save!
      post.published_at.to_s(:db).should eql((Time.zone.now).to_s(:db))
    end
  end
  
  describe 'published' do
    it 'should not return a non published post' do
      lambda do
        Factory(:unpublished_post)
      end.should change(Post.published, :count).by(0)
    end
    
    it 'should not return a post published in the future' do
      lambda do
        Factory(:future_published_post)
      end.should change(Post.published, :count).by(0)
    end
    
    it 'should return a published post' do
      lambda do
        Factory(:post)
      end.should change(Post.published, :count).by(1)
    end
  end
  
  describe 'drafts' do
    it 'should return a non published post' do
      lambda do
        Factory(:unpublished_post)
      end.should change(Post.drafts, :count).by(1)
    end
    
    it 'should return a post published in the future' do
      lambda do
        Factory(:future_published_post)
      end.should change(Post.drafts, :count).by(1)
    end
    
    it 'should not return a published post' do
      lambda do
        Factory(:post)
      end.should change(Post.drafts, :count).by(0)
    end
  end
  
  describe 'published?' do
    it 'should say the post is not published' do
      Factory(:unpublished_post).published?.should eql(false)
    end
    it 'should say the future dated post is not published' do
      Factory(:future_published_post).published?.should eql(false)
    end
    it 'should say the post is published' do
      Factory(:post).published?.should eql(true)
    end
  end
end
