class RenameCrewIdToTeamsId < ActiveRecord::Migration
  def change
    rename_column :members, :crew_id, :team_id
  end
end
