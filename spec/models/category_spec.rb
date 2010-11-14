# encoding: UTF-8
require 'spec_helper'

describe Category do
  
  it 'should require a title' do
    Category.create.errors[:title].should_not be_empty
  end
end
