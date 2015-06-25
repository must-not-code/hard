class DropTournaments < ActiveRecord::Migration
  def change
    drop_table :achievements
    drop_table :invites
    drop_table :kinds
    drop_table :results
    drop_table :teams
    drop_table :tournaments
  end
end
