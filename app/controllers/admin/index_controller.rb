class Admin::IndexController < Admin::BaseController
  def index
    @events_count = Event.count
    @members_count = Member.count
  end
end
