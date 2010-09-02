class Event < ActiveRecord::Base
  validates_presence_of :name, :when, :place_name, :address

  def self.next
    self.where(['`when` >= ?', DateTime.now.to_s(:db)]).order('`when` ASC').first
  end
end
