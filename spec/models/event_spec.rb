require 'spec_helper'

describe Event do
  it 'should create a new event' do
    lambda do
      Event.create! Factory.attributes_for(:event)
    end.should change(Event, :count).by(1)
  end
  
  describe 'next' do    
    it 'should return the next event' do
      Event.delete_all
      Timecop.freeze(1.month.ago) { Factory(:event) }
      Timecop.freeze(1.week.from_now) { Factory(:event) }
      Timecop.freeze(1.month.from_now) { Factory(:event) }
      Event.next.when.to_s.should eql((1.week.from_now + 1.day).to_s)
    end
    
    it 'should be nil if there are no event' do
      Event.delete_all
      Event.next.should be_nil
    end
  end
end
