class Event < ActiveRecord::Base
  validates_presence_of :name, :start_at, :place_name, :address

  def self.past
    self.where(["events.start_at <= ?", DateTime.now.to_s(:db)]).order("events.start_at DESC")
  end

  def self.upcoming
    self.where(["events.start_at >= ?", DateTime.now.to_s(:db)]).order("events.start_at ASC")
  end

  def self.next
    self.upcoming.first
  end
end
