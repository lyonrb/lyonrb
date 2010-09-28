require 'spec_helper'

describe "Home" do
  
  it 'should succeed to render the home' do
    get '/'
    response.should be_success
  end
  
  describe "events" do
    it 'should succeed to render without any event' do
      Event.delete_all
      get '/'
      response.should be_success
      response.body.should match(/No event is planned yet/)
    end
    
    it 'should succeed to render an event' do
      event = Factory(:event)
      get '/'
      response.should be_success
      response.body.should match(Regexp.new(event.place_name))
    end
  end
end