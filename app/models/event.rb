class Event < ActiveRecord::Base
  validates_presence_of :name, :when, :place_name, :address

  def self.next
    self.where(["events.when >= ?", DateTime.now.to_s(:db)]).order("events.when ASC").first
  end
end
