class RenameCrewsToTeams < ActiveRecord::Migration
  def change
    rename_table :crews, :teams
  end
end
