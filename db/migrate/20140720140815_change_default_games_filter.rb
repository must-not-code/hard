class ChangeDefaultGamesFilter < ActiveRecord::Migration
  def change
    change_column :users, :game, :string, :default => 'hs&lol&dota'
  end
end
