class AddTimestampsToStream < ActiveRecord::Migration
  def change
    add_column :streams, :created_at, :datetime
  end
end
