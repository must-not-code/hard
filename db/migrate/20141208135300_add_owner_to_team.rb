class AddOwnerToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :owner, :string
    add_column :users, :team_id, :integer
  end
end
