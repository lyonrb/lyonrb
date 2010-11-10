require 'spec_helper'

describe Event do
  it 'should create a new event' do
    lambda do
      Event.create! Factory.attributes_for(:event)
    end.should change(Event, :count).by(1)
  end

  context 'when scoped with' do
    before(:each) do
      Event.delete_all
      Timecop.freeze(1.month.ago) { Factory(:event) }
      Timecop.freeze(1.week.from_now) { Factory(:event) }
      Timecop.freeze(1.month.from_now) { Factory(:event) }
    end

    describe 'past' do
      it 'should only return past events' do
        Event.past.each do |e|
          e.start_at.to_time.should <= Time.now
        end
      end

      it 'should be nil if there are no event' do
        Event.delete_all
        Event.past.should be_blank
      end
    end

    describe 'upcoming' do
      it 'should only return upcoming events' do
        Event.upcoming.each do |e|
          e.start_at.to_time.should >= Time.now
        end
      end

      it 'should be nil if there are no event' do
        Event.delete_all
        Event.upcoming.should be_blank
      end
    end

    describe 'recent' do
      it 'should be enumerable' do
        lambda {Event.recent.each}.should_not raise_error
      end
    end

    describe 'next' do
      it 'should return the next event' do
        Event.next.start_at.to_s.should eql((1.week.from_now + 1.day).to_s)
      end

      it 'should be nil if there are no event' do
        Event.delete_all
        Event.next.should be_nil
      end
    end
  end
end
