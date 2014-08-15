class RemoveUserGames < ActiveRecord::Migration
  def change
    remove_column :users, :game
  end
end
