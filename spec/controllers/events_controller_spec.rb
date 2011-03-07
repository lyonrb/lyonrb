require 'spec_helper'

describe EventsController do
  include Devise::TestHelpers
  
  describe 'index' do
    it 'should succeed' do
      get :index
      response.should be_success
    end
    
    it 'should succeed in xml' do
      get :index, :format => 'xml'
      response.should be_success
    end
    
    describe 'ical' do
      it 'should succeed in ical' do
        get :index, :format => 'ics'
        response.should be_success
      end
      
      it 'should have a text/calendar content_type' do
        get :index, :format => 'ics'
        response.content_type.should eql('text/calendar')
      end
    end

    describe 'upcoming' do
      it 'should succeed' do
        get :upcoming
        response.should be_success
      end
    end

    describe 'past' do
      it 'should succeed' do
        get :past
        response.should be_success
      end
    end
  end
end
