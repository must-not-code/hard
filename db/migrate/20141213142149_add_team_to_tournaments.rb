class AddTeamToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :team, :boolean
  end
end
