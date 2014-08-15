class AddSeatsToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :seats, :integer, :default => 64
  end
end
