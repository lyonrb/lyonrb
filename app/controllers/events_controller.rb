class EventsController < ApplicationController
  def index
    @events = Event.all
    @past_events = Event.past.all
    @upcoming_events = Event.upcoming.all
    
    respond_to do |format|
      format.html # index.html.haml
      format.xml do
        render :layout => false
      end
      format.ics do
        @calendar = Icalendar::Calendar.new
        @events.each do |event|
          @calendar.event do
            dtstart       event.start_at
            dtend         event.start_at + 4.hours
            summary       event.name
            location      event.address
            klass         'PUBLIC'
          end
        end
        render :text => @calendar.to_ical
      end
    end
  end

  def upcoming
    @upcoming_events = Event.upcoming.all
  end

  def past
    @past_events = Event.past.all
  end
end
