class AddDefaultValueToGroupAttribute < ActiveRecord::Migration
  def change
    change_column :users, :group, :string, :default => 'user'
  end
end
