class WhenIsTimestampAndAddAddress < ActiveRecord::Migration
  def self.up
    change_table    :events do |t|
      t.remove      :when
      t.datetime    :when
      t.string      :address
    end
  end

  def self.down
    change_table    :events do |t|
      t.remove      :when
      t.string      :when
      t.remove      :address
    end
  end
end
