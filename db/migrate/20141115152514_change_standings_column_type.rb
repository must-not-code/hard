class ChangeStandingsColumnType < ActiveRecord::Migration
  def change
    add_column :tournaments, :temp_standings, :json
  end
end
