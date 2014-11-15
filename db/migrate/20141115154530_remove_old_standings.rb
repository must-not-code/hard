class RemoveOldStandings < ActiveRecord::Migration
  def change
    remove_column :tournaments, :standings
    rename_column :tournaments, :temp_standings, :standings
  end
end
