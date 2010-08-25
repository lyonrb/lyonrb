require 'spec_helper'

describe Event do
  it 'should create a new event' do
    lambda do
      Event.create! Factory.attributes_for(:event)
    end.should change(Event, :count).by(1)
  end
end
