class RemoveSomeDefaultValues < ActiveRecord::Migration
  def change
    change_column_default(:users, :tag, nil)
    change_column_default(:users, :skype, nil)
    change_column_default(:users, :about, nil)
    change_column_default(:posts, :game, nil)
  end
end
