class SorceryActivityLogging < ActiveRecord::Migration
  def change
    add_column :users, :last_activity_at, :datetime
    add_index :users, :last_activity_at
  end
end
