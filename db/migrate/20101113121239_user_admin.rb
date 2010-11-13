class UserAdmin < ActiveRecord::Migration
  def self.up
    change_table(:members) do |t|
      t.boolean :admin,   :default => false
    end
  end

  def self.down
    change_table(:members) do |t|
      t.remove :admin
    end
  end
end
