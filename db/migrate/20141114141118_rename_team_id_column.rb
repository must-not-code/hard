class RenameTeamIdColumn < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.rename :team_id, :crew_id
    end
  end
end
