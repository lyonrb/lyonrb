class Event < ActiveRecord::Base
  validates_presence_of :name, :when, :place_name
end
