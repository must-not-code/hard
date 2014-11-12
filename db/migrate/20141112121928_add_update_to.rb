class AddUpdateTo < ActiveRecord::Migration
  def change
    add_column :comments, :updated_at, :datetime
    add_column :kinds, :updated_at, :datetime
    add_column :posts, :updated_at, :datetime
    add_column :streams, :updated_at, :datetime
    add_column :tournaments, :updated_at, :datetime
    add_column :users, :updated_at, :datetime
  end
end
