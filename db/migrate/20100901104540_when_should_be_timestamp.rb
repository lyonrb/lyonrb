class WhenShouldBeTimestamp < ActiveRecord::Migration
  def self.up
    change_table    :events do |t|
      t.remove      :when
      t.datetime    :when
    end
  end

  def self.down
    change_table    :events do |t|
      t.remove      :when
      t.string      :when
    end
  end
end
