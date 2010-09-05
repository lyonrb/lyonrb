class EventsController < ApplicationController
  def index
    @events = Event.all
    
    respond_to do |format|
      format.html # index.html.haml
      format.xml do
        render :layout => false
      end
    end
  end

end
