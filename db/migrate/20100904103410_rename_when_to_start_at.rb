class RenameWhenToStartAt < ActiveRecord::Migration
  def self.up
    change_table    :events do |t|
      t.rename      :when,     :start_at
    end
  end

  def self.down
    change_table    :events do |t|
      t.rename      :start_at, :when
    end
  end
end
