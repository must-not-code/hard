class AddSkipSecondaryFinalToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :skip_secondary_final, :boolean
  end
end
