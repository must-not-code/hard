class AddPassingScoreToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :passing_score, :integer, :default => 0
  end
end
