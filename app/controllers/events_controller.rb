class EventsController < ApplicationController
  def list
    @events = Event.all
  end

end
