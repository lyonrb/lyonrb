class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :when
      t.string :place_name

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
