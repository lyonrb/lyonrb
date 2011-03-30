class Admin::EventsController < Admin::BaseController
  before_filter :find_event, :only => [:edit, :update, :show, :destroy]
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new params[:event]
    if @event.save
      render :show
    else
      render :new
    end
  end
  
  def show; end
  
  def update
    @event.attributes = params[:event]
    if @event.save
      render :show
    else
      render :new
    end
  end
  
  def edit
  end
  
  def destroy
    @event.destroy
    redirect_to admin_events_path
  end
  
  private
  def find_event
    @event = Event.find params[:id]
  end
end
