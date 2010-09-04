class Event < ActiveRecord::Base
  validates_presence_of :name, :start_at, :place_name, :address

  def self.next
    self.where(["events.start_at >= ?", DateTime.now.to_s(:db)]).order("events.start_at ASC").first
  end
end
