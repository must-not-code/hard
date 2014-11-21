class RemoveOldAvatarsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :old_avatar
  end
end
