require 'spec_helper'

describe "GET /events" do
  it "should succeed to render the page without any event" do
    Event.delete_all
    get events_path
    response.should be_success
  end
end

describe "GET /events/upcoming" do
  it "should succeed to render the page" do
    get upcoming_events_path
    response.should be_success
  end

  it "should list the upcoming events" do
    create_3_future_events
    visit upcoming_events_path
    page.should have_content "Apero"
  end

  it "should not list any events if there isn't any" do
    visit upcoming_events_path
    page.should have_no_content "Apero"
  end

end

describe "GET /events/past" do
  it "should succeed to render the page" do
    get past_events_path
    response.should be_success
  end

  it "should list the past events" do
    create_3_past_events
    visit past_events_path
    page.should have_content "Apero"
  end

  it "should not list any past events if there isn't any" do
    visit past_events_path
    page.should have_no_content "Apero"
  end
end

def create_3_past_events
  [1.day.ago, 1.week.ago, 1.month.ago].each do |time|
    Factory.create(:event, :start_at => time, :name => "Apero du #{time}")
  end
end

def create_3_future_events
  [1.day.from_now, 1.week.from_now, 1.month.from_now].each do |time|
    Factory.create(:event, :start_at => time, :name => "Apero du #{time}")
  end
end

