class AddSkipConsolationRoundToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :skip_consolation_round, :boolean
  end
end
