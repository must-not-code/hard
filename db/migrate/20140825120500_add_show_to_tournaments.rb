class AddShowToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :show, :boolean, :default => true
  end
end
