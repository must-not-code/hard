class AddGroupsToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :groups, :json
  end
end
