class RenameTeam < ActiveRecord::Migration
  def change
    rename_table :teams, :crews
  end
end
