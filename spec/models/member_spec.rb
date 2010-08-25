require 'spec_helper'

describe Member do
  it 'should create a new member' do
    lambda do
      Member.create! Factory.attributes_for(:member)
    end.should change(Member, :count).by(1)
  end
end
