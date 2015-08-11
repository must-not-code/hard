class RemoveTeamIdAndRatingFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :rating
    remove_column :users, :team_id
  end
end
